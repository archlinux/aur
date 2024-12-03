# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.3.0r196
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
           'java-runtime=23: the new class-file API'
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
            '2bb59a1cb743f9488876535df86d76ba6fe4ea8f054e437fae2599ff4f5421aa893f6adeb0d57c5eabc0e89a7609bd5738dc3b8faf5297f0738147a05b3e8571'
            '3b743c0b4dba7f130a43c6f5c476cb4f6e0d564e34fd36d7efa286c7eef054f62283788e8b8983ed69ad8c67229c14db162cc26122c760b4b10ca578b5e0de59'
            '482cfbb6c0d7a23e2a674417df04317084c43f9904635c9db7d83001eddc258288648a7f8f4b86ec5aaaf9dd9e6da1514c68bdb65a277907aa28434bc432aae0'
            'c2d9588c9fab56ed46e3cf620596c24d2a601e3be96e17a143dfe9d3d5834b6256361d4db5236bcd18291f42b1cb72ecaa7327f28e9dd43970670ac4c0c65a6d'
            '695885abfdc879aad9c0c91e6b69a9d87b82a024042739695d901c6e93cc9acd9cf1df7c743626358b1ece5b01ab3f47aa49dead7232d4711648e38925c9c64e'
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
    "patr-java-profiler-test-${_pkgver}.jar" de.hechler.patrick.profiler.test.PHPTestMain 11
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
