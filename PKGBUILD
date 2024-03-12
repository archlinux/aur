# Maintainer: Patrick Hechler <patrjprof@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.2.0
pkgrel=1
pkgdesc="An Open source Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL-3.0-or-later')
groups=()
depends=('java-runtime-headless>=8')
makedepends=()
optdepends=()
provides=()
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("patr-java-profiler-agent.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${pkgver}/patr-java-profiler-agent-${pkgver}-jar-with-dependencies.jar"
        "patr-java-profiler-bootstrap.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${pkgver}/patr-java-profiler-bootstrap-${pkgver}.jar"
        "patr-java-profiler-server.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-server/${pkgver}/patr-java-profiler-server-${pkgver}.jar"
        "patr-java-profiler-client.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-client/${pkgver}/patr-java-profiler-client-${pkgver}.jar"
        "patr-java-profiler-test.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${pkgver}/patr-java-profiler-test-${pkgver}.jar"
        "patr-java-profiler-start.sh::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler/${pkgver}/patr-java-profiler-${pkgver}.start-script"
        )
md5sums=('7394360f275817367f251fda05b891a7'
         '42ff09b4441deb2f327bf5c6722a90ff'
         '925d1b6a7d0d02bd5c92f4fa1a2b6e76'
         'ef5c4706cb06296e1ade4fd541211047'
         '14f7b04c0599e01f02cd4384c67bf1d7'
         '104ad32c6be4e03274a591746d7ace24'
         )

check() {
  cd "$srcdir"

  export VERSION="${pkgver}"
  export JAVA="java"

  export AGENT_JAR="$srcdir"/patr-java-profiler-agent.jar
  export BOOTSTRAP_JAR="$srcdir"/patr-java-profiler-bootstrap.jar
  export SERVER_JAR="$srcdir"/patr-java-profiler-server.jar
  export CLIENT_JAR="$srcdir"/patr-java-profiler-client.jar

  echo 'start test'
  sh ./patr-java-profiler-start.sh --no-server --no-client --no-defaults -cp "patr-java-profiler-test.jar" de.hechler.patrick.profiler.test.PHPTestMain | true
  echo 'validate test'
  sh ./patr-java-profiler-start.sh --only-client --validate patr-java-profiler-output.data
  echo 'finished test'
}

package() {
  cd "$srcdir"

  VERSION="${pkgver}"

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof
  cp -t "$pkgdir"/usr/share/java/patrjprof/ \
    patr-java-profiler-agent.jar \
    patr-java-profiler-bootstrap.jar \
    patr-java-profiler-server.jar \
    patr-java-profiler-client.jar

  # create help script which starts the profiler, the other script is not available
  mkdir -p "$pkgdir"/usr/bin
  AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
  BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
  echo -n '#!/bin/sh

AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
SERVER_JAR=/usr/share/java/patrjprof/patr-java-profiler-server.jar
CLIENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-client.jar

' > "$pkgdir"/usr/bin/patrjprof
  cat patr-java-profiler-start.sh >> "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
