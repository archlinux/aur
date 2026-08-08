#!/bin/sh
export PATH="/usr/lib/jvm/java-25-openjdk/bin/:$PATH"
cd /usr/share/Domination/
java -jar Domination.jar "$@"
