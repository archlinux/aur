# Maintainer: Patrick Hechler <patrjprof-git.aur@ph.anderemails.de>
pkgname=patrjprof-git
pkgver=1.4.0r259
pkgrel=1
pkgdesc="A Free Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=('git' 'java-environment>=8')
optdepends=('java-runtime>=8: graphical user interface'
            'java-runtime-headless>=16: support for socket files for server/client communication'
            'java-runtime-headless>=23: profile constructors with the new class-file API'
           )
provides=("patrjprof=${pkgver}")
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
_pjb_version=3.0.0
source=('git+https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler.git#branch=latest-snapshot'
        "https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/build/patr-java-build/$_pjb_version/patr-java-build-$_pjb_version.jar")
noextract=(patr-java-build-$_pjb_version.jar)
sha512sums=('SKIP'
            '37b081700ddaacac634320e304b55d64e59267aa1162e411e25cf105678b2603d7092bbe9ce95b9f2332fb2eea625108e3a362a9b122bdc450b6c2e9329564e5')

pkgver() {
  cd "patr-java-profiler"
  printf "%sr%s" "$(cat VERSION | sed -E 's/([^-]+)-SNAPSHOT/\1_snapshot./')" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir"/patr-java-profiler

  echo "build() called, pgkver=${pkgver}"
  echo 'start package'
  java -Dpjb.log=STEP -jar "$srcdir"/patr-java-build-$_pjb_version.jar package
  echo 'finished package'
}

check() {
  cd "$srcdir"/patr-java-profiler

  export JAVA=java
  export WD="$srcdir"/patr-java-profiler
  export VERSION=$(cat VERSION)

  export AGENT_JAR="$WD/patr-java-profiler-agent/dst/pkg/main/patr-java-profiler-agent.jar"
  export BOOTSTRAP_JAR="$WD/patr-java-profiler-bootstrap/dst/pkg/main/patr-java-profiler-bootstrap.jar"
  export SERVER_JAR="$WD/patr-java-profiler-server/dst/pkg/main/patr-java-profiler-server.jar"
  export CLIENT_JAR="$WD/patr-java-profiler-client/dst/pkg/main/patr-java-profiler-client.jar"

  echo 'start test'
  "$WD"/patr-java-prof-help.sh --no-server --no-client --no-defaults -jar "$WD/patr-java-profiler-test/dst/pkg/main/patr-java-profiler-test.jar" 11
  echo 'validate test'
  "$WD"/patr-java-prof-help.sh --only-client --validate patr-java-profiler-output.data
  echo 'finished test'
}

package() {
  cd "$srcdir"/patr-java-profiler

  VERSION="$(cat VERSION)"

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof

  cp -T patr-java-profiler-agent/dst/pkg/main/patr-java-profiler-agent.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar

  cp -T patr-java-profiler-bootstrap/dst/pkg/main/patr-java-profiler-bootstrap.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar

  cp -T patr-java-profiler-server/dst/pkg/main/patr-java-profiler-server.jar \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server.jar

  cp -T patr-java-profiler-client/dst/pkg/main/patr-java-profiler-client.jar \
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
