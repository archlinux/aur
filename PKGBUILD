# Maintainer: Patrick Hechler <patrjprof-git.aur@ph.anderemails.de>
pkgname=patrjprof-git
pkgver=1.7.0_snapshot.r343
pkgrel=1
pkgdesc="A Free Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=('git' 'java-environment>=8' 'make')
optdepends=('java-runtime>=8: graphical user interface'
            'java-runtime-headless>=16: support for socket files for server/client communication'
            'java-runtime-headless>=24: profile constructors with the new class-file API'
           )
provides=("patrjprof=${pkgver}")
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler.git#branch=latest-snapshot')
sha512sums=('SKIP')

pkgver() {
  cd "patr-java-profiler"
  printf "%sr%s" "$(cat VERSION | sed -E 's/([^-]+)-SNAPSHOT/\1_snapshot./')" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir"/patr-java-profiler

  echo "build() called, pgkver=${pkgver}"
  echo 'start package'
  make package
  echo 'finished package'
}

check() {
  cd "$srcdir"/patr-java-profiler

  export JAVA=java
  export WD="$srcdir"/patr-java-profiler
  export VERSION=$(cat VERSION)

  export AGENT_JAR="$WD/patr-java-profiler-agent/dst/pkg/main/patr-java-profiler-agent-$VERSION-classes.jar"
  export BOOTSTRAP_JAR="$WD/patr-java-profiler-bootstrap/dst/pkg/main/patr-java-profiler-bootstrap-$VERSION-classes.jar"
  export SERVER_JAR="$WD/patr-java-profiler-server/dst/pkg/main/patr-java-profiler-server-$VERSION-classes.jar"
  export CLIENT_JAR="$WD/patr-java-profiler-client/dst/pkg/main/patr-java-profiler-client-$VERSION-classes.jar"

  echo 'start test'
  "$WD"/patr-java-prof-help.sh --no-server --no-client --no-defaults -jar "$WD/patr-java-profiler-test/dst/pkg/main/patr-java-profiler-test-$VERSION-classes.jar" 11
  echo 'validate test'
  "$WD"/patr-java-prof-help.sh --only-client --validate patr-java-profiler-output.data
  echo 'finished test'
}

package() {
  cd "$srcdir"/patr-java-profiler

  VERSION="$(cat VERSION)"

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof

  cp -T patr-java-profiler-agent/dst/pkg/main/patr-java-profiler-agent-$VERSION-classes.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent-$VERSION.jar

  cp -T patr-java-profiler-bootstrap/dst/pkg/main/patr-java-profiler-bootstrap-$VERSION-classes.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap-$VERSION.jar

  cp -T patr-java-profiler-server/dst/pkg/main/patr-java-profiler-server-$VERSION-classes.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server-$VERSION.jar

  cp -T patr-java-profiler-client/dst/pkg/main/patr-java-profiler-client-$VERSION-classes.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client-$VERSION.jar

  ln -sT patr-java-profiler-agent-$VERSION.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar
  ln -sT patr-java-profiler-bootstrap-$VERSION.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
  ln -sT patr-java-profiler-server-$VERSION.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server.jar
  ln -sT patr-java-profiler-client-$VERSION.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client.jar

  # create script which starts the profiler
  mkdir -p "$pkgdir"/usr/bin
  echo '#!/bin/sh' > "$pkgdir"/usr/bin/patrjprof
  # do not change the SPDX license Identifier
  head -1 patr-java-prof-help.sh >> "$pkgdir"/usr/bin/patrjprof
  echo -n "
# set the values needed for the script
AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent-$VERSION.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap-$VERSION.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server-$VERSION.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client-$VERSION.jar

# helper script from git
" >> "$pkgdir"/usr/bin/patrjprof
  tail +2 patr-java-prof-help.sh >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
