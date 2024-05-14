# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.2.3r149
_pkgver="$(echo "${pkgver}" | sed -E 's/r[0-9]+$//')"
pkgrel=1
pkgdesc="A Free Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=()
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

source=("patr-java-profiler-start-${_pkgver}.sh::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler/${_pkgver}/patr-java-profiler-${_pkgver}.start-script"
        "patr-java-profiler-agent-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${_pkgver}/patr-java-profiler-agent-${_pkgver}-jar-with-dependencies.jar"
        "patr-java-profiler-bootstrap-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${_pkgver}/patr-java-profiler-bootstrap-${_pkgver}.jar"
        "patr-java-profiler-client-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-client/${_pkgver}/patr-java-profiler-client-${_pkgver}.jar"
        "patr-java-profiler-server-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-server/${_pkgver}/patr-java-profiler-server-${_pkgver}.jar"
        "patr-java-profiler-test-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${_pkgver}/patr-java-profiler-test-${_pkgver}.jar"
        )
noextract=("${source[@]%%::*}")
sha512sums=('cdef6de2254f01d4398b2fcd8f9c43ca5aa1cac5d44d66595f0c0d7cdcab5082dea7fd323548df46dde468b5f307cc44a267927ed103324b2e0f41df99ab0bc4'
            'fa8e8d274d4d1dd15e9dba377783e49191de5e55ccc5b5e4a2c765c525ece8e3ddccee583cb266ef247b5af12569e77a9c3325b3e659442dc62d782ba913a805'
            '5d29b69636e06c830d006af148c79812cf7339ced88ddee59cf5add839cef934ebf1842554ec95bf89281ad34e12e9eac46fdbc861920f93f167d7543f7ff4d8'
            'cc85720462434d8692c2d8856004de444396906c616aa6b896d3cac150027d594f52b3f5e1001ba3038bda84b3fc3f8398c2a18c2e09250a36ed026f6400204e'
            '7cb871422c5c766b09c2a6dfe211191162bd8f0324470163e603e24c93981f027bb52d9c5d492f7200d400e9219660a04b6b2301c2e71e1d9f2792f27bb37bdc'
            '11ac044870838e2a8d6fe8c593bde02786d62aaae68ff5b77a6e4a2bf355366f1137f940b52b8541613a68a24c0cc6a4839a7e2d3f066dc058e81c04f8f2e792'
            )

build() {
  cd "$srcdir"

  chmod +x "./patr-java-profiler-start-${_pkgver}.sh"
}

check() {
  cd "$srcdir"

  export JAVA=java

  export AGENT_JAR="patr-java-profiler-agent-${_pkgver}.jar"
  export BOOTSTRAP_JAR="patr-java-profiler-bootstrap-${_pkgver}.jar"
  export SERVER_JAR="patr-java-profiler-server-${_pkgver}.jar"
  export CLIENT_JAR="patr-java-profiler-client-${_pkgver}.jar"

  echo 'start test'
  "./patr-java-profiler-start-${_pkgver}.sh" --no-server --no-client --no-defaults -cp \
    "patr-java-profiler-test-${_pkgver}.jar" de.hechler.patrick.profiler.test.PHPTestMain > /dev/null
  echo 'validate test'
  "./patr-java-profiler-start-${_pkgver}.sh" --only-client --validate patr-java-profiler-output.data
  echo 'finished test'
}

package() {
  cd "$srcdir"

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof

  cp -T "patr-java-profiler-agent-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar

  cp -T "patr-java-profiler-bootstrap-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar

  cp -T "patr-java-profiler-server-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server.jar

  cp -T "patr-java-profiler-client-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client.jar

  # create script which starts the profiler
  mkdir -p "$pkgdir"/usr/bin
  echo '#!/bin/sh' > "$pkgdir"/usr/bin/patrjprof
  # do not change the SPDX license Identifier
  head -1 "patr-java-profiler-start-${_pkgver}.sh" >> "$pkgdir"/usr/bin/patrjprof
  echo -n "
# set the values needed for the script
AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client.jar

# helper script from git
" >> "$pkgdir"/usr/bin/patrjprof
  tail +2 "patr-java-profiler-start-${_pkgver}.sh" >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
