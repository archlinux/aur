# Maintainer: Patrick Hechler <patrjprof@ph.anderemails.de>
pkgname=patrjprof
pkgver=1.1.0
pkgrel=1
pkgdesc="An Open source Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL')
groups=()
depends=('java-runtime-headless>=8')
makedepends=('curl')
optdepends=()
provides=("patrjprof=${pkgver}")
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("patr-java-profiler-agent-${pkgver}-jar-with-dependencies.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-agent/${pkgver}/patr-java-profiler-agent-${pkgver}-jar-with-dependencies.jar"
        "patr-java-profiler-bootstrap-${pkgver}.jar::https://nexuspat.hechler.de/repository/maven-releases/de/hechler/patrick/profiler/patr-java-profiler-bootstrap/${pkgver}/patr-java-profiler-bootstrap-${pkgver}.jar"
        )
md5sums=('06c3fcba9e169ea05423e9814980eb54'
         '32688535a6ffce4eec273596f52cf241'
         )

package() {
  cd "$srcdir"

  VERSION=${pkgver}

  # copy original files
  mkdir -p "$pkgdir"/usr/share/java/patrjprof
  cp -t "$pkgdir"/usr/share/java/patrjprof \
    patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar \
    patr-java-profiler-bootstrap-$VERSION.jar

  # create symlink of agent/bootstrap without version/version-with-deps appendix
  ln -sT patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent-jar-with-dependencies.jar
  ln -sT patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-agent.jar
  ln -sT patr-java-profiler-bootstrap-$VERSION.jar "$pkgdir"/usr/share/java/patrjprof/patr-java-profiler-bootstrap.jar

  # create help script which starts the profiler, the other script is not available
  AGENT_JAR=/usr/share/java/patrjprof/patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar
  BOOTSTRAP_JAR=/usr/share/java/patrjprof/patr-java-profiler-bootstrap-$VERSION.jar
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
