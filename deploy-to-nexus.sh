#!/bin/sh

# Adjust artifact version in oiosaml/pom.xml and run this script


VERSION=`grep -m 1 "<version>" oiosaml/pom.xml|sed -E 's/.*<version>(.*)<\/version>.*/\1/'`

mvn deploy:deploy-file \
  -DpomFile=oiosaml/pom.xml \
  -Dfile=oiosaml/target/oiosaml2.java-$VERSION.jar \
  -DrepositoryId=trifork.releases \
  -Durl=https://ci.fmk.netic.dk/nexus/content/repositories/releases/


