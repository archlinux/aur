# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.7.3.r417
_pkgver="$(echo "${pkgver}" | sed -E 's/[.]r[0-9]+$//')"
pkgrel=1
pkgdesc="A Free Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=()
optdepends=('java-runtime>=8: graphical user interface'
            'java-runtime-headless>=16: support for socket files for server/client communication'
            'java-runtime-headless>=24: profile constructors with the new class-file API'
           )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("patr-java-profiler-start-${_pkgver}.sh::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler/${_pkgver}/patr-java-profiler-${_pkgver}.start-script"
        "patr-java-profiler-agent-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${_pkgver}/patr-java-profiler-agent-${_pkgver}.jar"
        "patr-java-profiler-bootstrap-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${_pkgver}/patr-java-profiler-bootstrap-${_pkgver}.jar"
        "patr-java-profiler-client-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-client/${_pkgver}/patr-java-profiler-client-${_pkgver}.jar"
        "patr-java-profiler-server-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-server/${_pkgver}/patr-java-profiler-server-${_pkgver}.jar"
        "patr-java-profiler-test-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${_pkgver}/patr-java-profiler-test-${_pkgver}.jar"
        )
noextract=("${source[@]%%::*}")
sha512sums=('cdef6de2254f01d4398b2fcd8f9c43ca5aa1cac5d44d66595f0c0d7cdcab5082dea7fd323548df46dde468b5f307cc44a267927ed103324b2e0f41df99ab0bc4'
            '5b7650ef10a05a6f9ba977c1e9ea8956d00ee4edf1dbdc94caf5f69086c69c56378257caa0cc6340146121771e5e631883baa8dbb1a4b0bd8cc5d25307e48064'
            '80427d2a22a96c6fd0a66f717820e3be22cc6e48a2a15a0f2e309bd4378e32d01c9d44dbaa92e37dad9f3bc613fc1fe6763633651a6ae8613c7ab95065faf2df'
            'fa50a4745a2309a61c4551a659bccd21351140068649df075b66b27514f400f61d332f1bf0d2e7fdc68cb2a9f49dbf8c65617ad287b99746ffb814fafecd2b10'
            '27eb5b220f8bb02b2a69852386e097a6795a2dec90d0b2b1c9efcb5099badb4fdf09f38206314be9ffb6ecdd4fa842ecb788add54cd6967beaa480e116053362'
            '62ee6d4325f0642e2de45817b78b8aebfb821094f41f549f29d75ea531f2b5299afb1f2f9f7b2a06439ba9ff329bc7b1ed0e3e6beee9088234ac660cb60f98a8'
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

  if test -f patr-java-profiler-output.data; then
    rm patr-java-profiler-output.data
  fi
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
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent-${_pkgver}.jar

  cp -T "patr-java-profiler-bootstrap-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap-${_pkgver}.jar

  cp -T "patr-java-profiler-server-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server-${_pkgver}.jar

  cp -T "patr-java-profiler-client-${_pkgver}.jar" \
    "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client-${_pkgver}.jar

  ln -sT patr-java-profiler-agent-${_pkgver}.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar
  ln -sT patr-java-profiler-bootstrap-${_pkgver}.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
  ln -sT patr-java-profiler-server-${_pkgver}.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-server.jar
  ln -sT patr-java-profiler-client-${_pkgver}.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-client.jar

  # create script which starts the profiler
  mkdir -p "$pkgdir"/usr/bin
  echo '#!/bin/sh' > "$pkgdir"/usr/bin/patrjprof
  # do not change the SPDX license Identifier
  head -1 "patr-java-profiler-start-${_pkgver}.sh" >> "$pkgdir"/usr/bin/patrjprof
  echo -n "
# set the values needed for the script
AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent-${_pkgver}.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap-${_pkgver}.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server-${_pkgver}.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client-${_pkgver}.jar

# helper script from git
" >> "$pkgdir"/usr/bin/patrjprof
  tail +2 "patr-java-profiler-start-${_pkgver}.sh" >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
