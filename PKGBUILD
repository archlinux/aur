# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=globalplatformpro-git
pkgver=19.06.16.r4.g1f6b677
pkgrel=1
pkgdesc="A powerful tool for managing applets and keys on JavaCards based on the GlobalPlatform specifications"
arch=('any')
url="https://javacard.pro/globalplatform/"
license=('LGPL3')
depends=('java-runtime-headless>=8' 'pcsclite')
makedepends=('apache-ant' 'git' 'java-environment=8' 'maven')
source=(
  "$pkgname::git+https://github.com/martinpaljak/GlobalPlatformPro.git"
  'gp-pro'
)
sha256sums=(
  'SKIP'
  'a8769c37ac54b3e98645f509b011a290d7e914937de0158cc8f2a8fcef0e255e'
)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}

build() {
  cd $pkgname

  # Build only works on Java 8, so set JAVA_HOME to OpenJDK 8.
  if [ -d /usr/lib/jvm/java-8-openjdk ]; then
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  else
    echo "WARNING: OpenJDK 8 not found. If the build fails, select a version 8 JDK using \"archlinux-java\"."
  fi

  mvn package
  ant
}

package() {
  # Install the executables
  install -d "$pkgdir"/usr/bin/
  install -m 755 gp-pro "$pkgdir"/usr/bin/
  cd $pkgname
  install -d "$pkgdir"/usr/share/java/globalplatformpro/
  install -m 644 gp.jar "$pkgdir"/usr/share/java/globalplatformpro/
}
