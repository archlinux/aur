# Maintainer: Patrick Hechler <patrjprof.aur@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.5.1r284
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
            'java-runtime-headless>=23: profile constructors with the new class-file API'
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
            '3684a72517e80f42e88a4495e1564cbed982f245df376aaab169f35a1501b83421398f72d015406906cae2f511c7e0294eeae0edd5a1738fcc636ef3fe6d6e88'
            'c3e200937f2d59fb994d7c5da42ef7b07f53a1df7d71d4be0338b900ed67c0e05425edafb03d116ad417edb7997bebe4a0040ebae38bc415eb7ee1b4c70d8677'
            '649b4e7943fc58df243995a3b110d34509144f94e38ab7aa200f534b20f822fbc88de34fcd41f6c47b7ce5c9afb94b77aaf3d538375569cf5ffafd15e4511736'
            '4facd3bf252a7cd7f0e91233e8f352620bd2bcfc4c5144443f9fa48072db1de7a11f5489e154beec2cc58fe81f53648fd819a4f0bc00185d04e499829c372809'
            '671d809df313fb47a13831fbf06055f39f1049174ea5f3ecc2a5cdb453971de3597e80dd4e9ed0d86009ef217d759906ff00089c821ccb67d996de9376ebdfc1'
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
