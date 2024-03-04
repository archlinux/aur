# Maintainer: Patrick Hechler <patrjprof-git@ph.anderemails.de>
pkgname=patrjprof-git
pkgver=1.1.0r42.1806883
pkgrel=1
pkgdesc="An Open source Java profiler written in Java"
arch=('any')
url="https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler"
license=('AGPL')
groups=()
depends=('java-runtime-headless>=8')
makedepends=('git' 'maven' 'java-runtime-headless>=8')
optdepends=()
provides=("patrjprof=${pkgver}")
conflicts=('patrjprof')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://git.rwth-aachen.de/patrick_laszlo.hechler/patr-java-profiler.git#branch=latest-snapshot')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "patr-java-profiler"
  printf "%sr%s.%s" "$(cat VERSION | sed -E 's/([^-]+)-SNAPSHOT/\1.snapshot/')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir"/patr-java-profiler
  
  echo "build() called, pgkver=${pkgver}"
  echo 'start package'
  mvn package -Dmaven.test.skip=true
  echo 'finished package'
}

check() {
  cd "$srcdir"/patr-java-profiler

  echo 'start test'
  mvn test
  echo 'finished test'

  export WD="$srcdir"/patr-java-profiler
  export VERSION=$(cat VERSION)
  export BOOTSTRAP_NAME=
  export AGENT_NAME=
  export AGENT_FOLDER=
  export BOOTSTRAP_FOLDER=
  export AGENT_JAR= 
  export BOOTSTRAP_JAR=
  echo 'start test2'
  ./patr-java-prof.sh -cp "patr-java-profiler-test/target/patr-java-profiler-test-$VERSION.jar" de.hechler.patrick.profiler.test.PHPTestMain
  echo 'finished test2:'
  cat ./patr-java-profiler-output.txt # at least ensure that the file exists, if not something went completly wrong
}

package() {
  cd "$srcdir"/patr-java-profiler
  
  VERSION="$(cat VERSION)"
  
  # copy original files
  mkdir -p "$pkgdir"/usr/lib/patrjprof
  cp -t "$pkgdir"/usr/lib/patrjprof \
    patr-java-profiler-agent/target/patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar \
    patr-java-profiler-bootstrap/target/patr-java-profiler-bootstrap-$VERSION.jar \
    patr-java-prof.sh

  # create symlink of agent/bootstrap without version/version-with-deps appendix
  ln -sT patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar "$pkgdir"/usr/lib/patrjprof/patr-java-profiler-agent-jar-with-dependencies.jar
  ln -sT patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar "$pkgdir"/usr/lib/patrjprof/patr-java-profiler-agent.jar
  ln -sT patr-java-profiler-bootstrap-$VERSION.jar "$pkgdir"/usr/lib/patrjprof/patr-java-profiler-bootstrap.jar

  # create help script which initilizes the enviroment for the other script
  echo -n "#!/bin/sh
export VERSION=$VERSION
export AGENT_JAR=/usr/lib/patrjprof/patr-java-profiler-agent-$VERSION-jar-with-dependencies.jar
export BOOTSTRAP_JAR=/usr/lib/patrjprof/patr-java-profiler-bootstrap-$VERSION.jar
export WD=/usr/lib/patrjprof
exec /usr/lib/patrjprof/patr-java-prof.sh "'"$@"' > "$pkgdir"/usr/lib/patrjprof/patrjprof.sh
  chmod +x "$pkgdir"/usr/lib/patrjprof/patrjprof.sh

  # create symlink to the helper script
  mkdir -p "$pkgdir"/usr/bin
  ln -sT ../lib/patrjprof/patrjprof.sh "$pkgdir"/usr/bin/patrjprof
}
