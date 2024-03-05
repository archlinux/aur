# Maintainer: Patrick Hechler <patrjprof@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.1.1
pkgrel=1
pkgdesc="An Open source Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL')
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
        "patr-java-profiler-test.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-test/${pkgver}/patr-java-profiler-test-${pkgver}.jar"
        )
md5sums=('e034c1717ad0ae7c5d850743fe1aa31a'
         '6648203ec0369816b5d7d24259a4b9f1'
         'ad15430e3f2cd76107723eda8266cb8f'
         )

check() {
  cd "$srcdir"

  echo 'start test'
  java \
    "-javaagent:patr-java-profiler-agent.jar" \
    "-Xbootclasspath/a:patr-java-profiler-bootstrap.jar" \
    -cp "patr-java-profiler-test.jar" \
    de.hechler.patrick.profiler.test.PHPTestMain
  echo 'finished test:'
  cat ./patr-java-profiler-output.txt # at least ensure that the file exists, if not something went completly wrong
}

package() {
  cd "$srcdir"

  VERSION=${pkgver}

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof
  cp -T patr-java-profiler-bootstrap.jar  "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
  cp -T patr-java-profiler-agent.jar      "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar

  # create help script which starts the profiler, the other script is not available
  mkdir -p "$pkgdir"/usr/bin
  AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent.jar
  BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar
  echo -n '#!/bin/sh

AGENT_ARGS=""
ADD_ARGS_START=1
if test "$1" = "--agent"; then
  AGENT_ARGS="=$2"
  ADD_ARGS_START=3
elif test "$1" = "--bootstrap"; then
  exec java -cp '$BOOTSTRAP_JAR' \
    de.hechler.patrick.profiler.Main "${@:2}"
fi

if test $ADD_ARGS_START -gt $# ; then
  echo -n "missing additional arguments!
you need to specify what you want to profile!

" >&2
  AGENT_ARGS="=help"
fi

exec java \
  "-javaagent:'$AGENT_JAR'$AGENT_ARGS" \
  "-Xbootclasspath/a:'$BOOTSTRAP_JAR'" \
  "${@:$ADD_ARGS_START}"' > "$pkgdir"/usr/bin/patrjprof
  chmod +x "$pkgdir"/usr/bin/patrjprof
}
