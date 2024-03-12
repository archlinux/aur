# Maintainer: Patrick Hechler <patrjprof-git@ph.anderemails.de>
pkgname=patrjprof-git
pkgver=1.2.0.snapshotr115.5eb3ddc
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
provides=("patrjprof=${pkgver}")
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler.git#branch=latest-snapshot')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "patr-java-profiler"
  printf "%sr%s.%s" "$(cat VERSION | sed -E 's/([^-]+)-SNAPSHOT/\1.snapshot/')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  echo -n "#!/bin/sh
#set values needed for the script
AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client.jar

#helper script from git
" > "$pkgdir"/usr/bin/patrjprof
  cat patr-java-prof-help.sh >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
