# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.2.3r149
pkgrel=1
pkgdesc="An Open source Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=('git' 'maven' 'java-environment>=8')
optdepends=('java-runtime-headless>=16: support for socket files for server/client communication'
           'java-runtime>=8: graphical user interface'
           'java-runtime>=16: socket files + graphical user interface'
           )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

#makedepends=()
#source=("patr-java-profiler-agent-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${pkgver}/patr-java-profiler-agent-${pkgver}-jar-with-dependencies.jar"
#        "patr-java-profiler-bootstrap-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${pkgver}/patr-java-profiler-bootstrap-${pkgver}.jar"
#        "patr-java-profiler-server-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-server/${pkgver}/patr-java-profiler-server-${pkgver}.jar"
#        "patr-java-profiler-client-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-client/${pkgver}/patr-java-profiler-client-${pkgver}.jar"
#        "patr-java-profiler-test-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${pkgver}/patr-java-profiler-test-${pkgver}.jar"
#        "patr-java-profiler-start-${pkgver}.sh::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler/${pkgver}/patr-java-profiler-${pkgver}.start-script"
#        )
#noextract=("${source[@]%%::*}")
#md5sums=('e6b77e1d61b5bcffb8d5d328521883b7'
#         '38c0be0018ca6dbe513836591c1ed503'
#         'bab5fc52dddc17c436d84bcc9785f7cf'
#         '4037ab20fa4133b9204d8eb9aa86d864'
#         '12d89bd966bf8d5f31386f581c91847e'
#         '7b89dd802897987cedd7636d94571a82'
#         )
source=('git+https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler.git#commit=fac3a42eb14e58e43237a19953ecf4b1cf34a450')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "patr-java-profiler"
  printf "%sr%s" "$(cat VERSION | sed -E 's/([^-]+)-SNAPSHOT/\1.snapshot/')" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir"/patr-java-profiler

  echo "build() called, pgkver=${pkgver}"
  echo 'start package'
  mvn package -Dmaven.test.skip=true
  echo 'finished package'
}

check() {
  cd "$srcdir"/patr-java-profiler

  echo 'start test'
  mvn test
  echo 'finished test'

  export JAVA=java
  export WD="$srcdir"/patr-java-profiler
  export VERSION=$(cat VERSION)

  export AGENT_FOLDER=
  export BOOTSTRAP_FOLDER=
  export SERVER_FOLDER=
  export CLIENT_FOLDER=

  export BOOTSTRAP_FNAME=
  export AGENT_FNAME=
  export SERVER_FNAME=
  export CLIENT_FNAME=

  export AGENT_JAR=
  export BOOTSTRAP_JAR=
  export SERVER_JAR=
  export CLIENT_JAR=

  echo 'start test2'
  ./patr-java-prof.sh --no-server --no-client --no-defaults -cp "patr-java-profiler-test/target/patr-java-profiler-test-$VERSION.jar" de.hechler.patrick.profiler.test.PHPTestMain
  echo 'validate test2'
  ./patr-java-prof.sh --only-client --validate patr-java-profiler-output.data
  echo 'finished test2'
}

package() {
  cd "$srcdir"/patr-java-profiler

  VERSION="$(cat VERSION)"

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof

  cp -T patr-java-profiler-agent/target/patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar

  cp -T patr-java-profiler-bootstrap/target/patr-java-profiler-bootstrap-$VERSION.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar

  cp -T patr-java-profiler-server/target/patr-java-profiler-server-$VERSION.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server.jar

  cp -T patr-java-profiler-client/target/patr-java-profiler-client-$VERSION.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client.jar

  # create script which starts the profiler
  mkdir -p "$pkgdir"/usr/bin
  echo '#!/bin/sh' > "$pkgdir"/usr/bin/patrjprof
  # do not change the SPDX license Identifier
  head -1 patr-java-prof-help.sh >> "$pkgdir"/usr/bin/patrjprof
  echo -n "
# set the values needed for the script
AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client.jar

# helper script from git
" >> "$pkgdir"/usr/bin/patrjprof
  tail +2 patr-java-prof-help.sh >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}

#check() {
#  cd "$srcdir"
#
#  export VERSION="${pkgver}"
#  export JAVA="java"
#
#  export AGENT_JAR="$srcdir/patr-java-profiler-agent-${pkgver}.jar"
#  export BOOTSTRAP_JAR="$srcdir/patr-java-profiler-bootstrap-${pkgver}.jar"
#  export SERVER_JAR="$srcdir/patr-java-profiler-server-${pkgver}.jar"
#  export CLIENT_JAR="$srcdir/patr-java-profiler-client-${pkgver}.jar"
#
#  echo 'start test'
#  sh ./patr-java-profiler-start-${pkgver}.sh \
#     --no-server --no-client --no-defaults \
#     -cp "$srcdir/patr-java-profiler-test-${pkgver}.jar" \
#     de.hechler.patrick.profiler.test.PHPTestMain > /dev/null
#  echo 'validate test'
#  sh ./patr-java-profiler-start-${pkgver}.sh --only-client \
#     --validate patr-java-profiler-output.data
#  echo 'finished test'
#}
#
#package() {
#  cd "$srcdir"
#
#  VERSION="${pkgver}"
#
##   copy original files
#  mkdir -p "$pkgdir"/usr/share/java/patrjprof
#  cp -t "$pkgdir"/usr/share/java/patrjprof/ \
#    patr-java-profiler-agent-${pkgver}.jar \
#    patr-java-profiler-bootstrap-${pkgver}.jar \
#    patr-java-profiler-server-${pkgver}.jar \
#    patr-java-profiler-client-${pkgver}.jar
#
##   create script which starts the profiler
#  mkdir -p "$pkgdir"/usr/bin
#  echo '#!/bin/sh' > "$pkgdir"/usr/bin/patrjprof
##   do not change the SPDX license Identifier
#  head -1 patr-java-profiler-start-${pkgver}.sh >> "$pkgdir"/usr/bin/patrjprof
#  echo -n '
## set the values needed for the script
#AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
#BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
#SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server.jar
#CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client.jar
#
## helper script
#' >> "$pkgdir"/usr/bin/patrjprof
#  tail +2 patr-java-profiler-start-${pkgver}.sh >> "$pkgdir"/usr/bin/patrjprof
#  chmod +x "$pkgdir"/usr/bin/patrjprof
#}
