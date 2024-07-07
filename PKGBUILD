# Maintainer : Christoph Scholz <christoph.scholz@gmail.com>

_pkgname=p2
pkgname=${_pkgname}-git
pkgver=r56.8b83fd5
pkgrel=1
epoch=1
pkgdesc="An XEP-0357: Push Notifications app server that relays push messages between the user’s server and Googles Firebase Cloud Messaging"
arch=('any')
url="https://github.com/iNPUTmice/p2"
license=('BSD')
makedepends=('git' 'maven' 'java-environment=11')
depends=('java-runtime=11')

backup=(
  'etc/p2.conf'
  )

install="${_pkgname}.install"

source=(
	"${_pkgname}::git+https://github.com/iNPUTmice/p2.git"
  "p2.install"
	)

sha256sums=('SKIP'
            'd0d2b1f89730badaef34a7158a5dc46dedbe67999611766aac3b61d7c8fb86be')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"

  # Set environment
  msg2 "Assessing Java build environment"
  unset JAVA_HOME

  # test for openjdk, fall back on other jdks if not found
  # Take the highest sorted version (alpahumericly,head -1)
  _openjdk=$(ls /usr/lib/jvm/java-11-openjdk/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _openjdk_jetbeans=$(ls /usr/lib/jvm/java-11-openjdk-jetbrains/bin/javac 2>/dev/null | cut -d "/" -f-5)
  _oraclejdk=$(ls /usr/lib/jvm/java-11-jdk/bin/javac 2>/dev/null | cut -d "/" -f-5)

  if (( $(archlinux-java get | cut -d "-" -f2) != 11 )) || [[ ! -f /usr/bin/javac ]]; then

    if [[ "${_openjdk}" ]]; then
      # choose the first one available
      msg2 "Using OpenJDK for build"
      export JAVA_HOME="${_openjdk[0]}"

    elif [[ "${_oraclejdk}" ]]; then
      msg2 "Using Oracle JDK for build"
      export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

    elif [[ "${_openjdk_jetbrains}" ]]; then
      msg2 "Using Jetbrains for build"
      export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk-jetbrains*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)

    else
      # fall back to other JDKs
      export JAVA_HOME=$(ls /usr/lib/jvm/java-11-jdk*/bin/javac 2>/dev/null | cut -d "/" -f-5 | head -1)
      msg2 "Using JDK $JAVA_HOME"
    fi

  else

    msg2 "Default Java JDK set is of verison 11, proceeding..."
    msg2 "Using: $(archlinux-java get)"
    export JAVA_HOME="/usr/lib/jvm/default"

  fi

  if [[ ! "${JAVA_HOME}" ]]; then
    msg2 "ERROR: Could not find a proper java build environment. Exiting"
    exit 1
  fi

  sed -i '/Conscrypt/d' src/main/java/eu/siacs/p2/P2.java

  mvn package -Dspotless.check.skip=true
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/opt/"
  cp target/p2-0.3.2.jar "${pkgdir}/opt/"
  install -d "${pkgdir}/etc/"
  install -d "${pkgdir}/etc/p2"
  cp p2.conf.example "${pkgdir}/etc/p2/config.json"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  cp dist/p2.service "${pkgdir}/usr/lib/systemd/system/"
  install -d "${pkgdir}/var/lib/p2/"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}/"
  cp LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
