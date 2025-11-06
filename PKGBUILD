# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.7.0r401
_pkgver="$(echo "${pkgver}" | sed -E 's/r[0-9]+$//')"
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
        "patr-java-profiler-agent-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${_pkgver}/patr-java-profiler-agent-${_pkgver}-jar-with-dependencies.jar"
        "patr-java-profiler-bootstrap-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${_pkgver}/patr-java-profiler-bootstrap-${_pkgver}.jar"
        "patr-java-profiler-client-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-client/${_pkgver}/patr-java-profiler-client-${_pkgver}.jar"
        "patr-java-profiler-server-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-server/${_pkgver}/patr-java-profiler-server-${_pkgver}.jar"
        "patr-java-profiler-test-${_pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${_pkgver}/patr-java-profiler-test-${_pkgver}.jar"
        )
noextract=("${source[@]%%::*}")
sha512sums=('cdef6de2254f01d4398b2fcd8f9c43ca5aa1cac5d44d66595f0c0d7cdcab5082dea7fd323548df46dde468b5f307cc44a267927ed103324b2e0f41df99ab0bc4'
            '48761577f594ddbcc90837db49f591ad6b5251523277bc95c7f55b3fc9d6e67691167cad5416b886dcd5450148097b835cd659a01e5cb15d56dd8bdc3a2ca513'
            '2b5287be0e28cb91d1b9f1d106cab636e4894f4a3a3f97497a67a4ee62086821f6a6a53a5b34c393c9cd8010e8bd9c4f8cf07d50b8a910b29bafe2d36a33b00e'
            '33cfb8498b7df289d24b3fb9279241cffe4502a519c13f555c7c172702eff812002449287796ec42f98ce45339aff4930d587e5bf9e48e6a8b1208175dc6f7c0'
            'cd7e73896aa586f32e01f49a9f9e68e5dc6607c8746dc8f3887e30ebad193029caf43ad5ca83a84365788a0ecd35174945a7ede3c686b4c69ed0ae7c20f68dc0'
            '6c3aa47c765848bdc2dc2c02733287727707990e20e33ffe87f2e3ce5d608812e681f29cb914838d9d22745fb7dbcbc816dbcf123b15186706c181ba4ea171e6'
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
