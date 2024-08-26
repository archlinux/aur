# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=globalplatformpro-git
pkgver=21.12.31.r55.g52c3581
pkgrel=1
pkgdesc="A powerful tool for managing applets and keys on JavaCards based on the GlobalPlatform specifications"
arch=('any')
url="https://javacard.pro/globalplatform/"
license=('LGPL-3.0-only')
depends=('java-runtime-headless>=11' 'pcsclite')
makedepends=('git' 'java-environment' 'maven')
provides=('globalplatformpro')
conflicts=('globalplatformpro')
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
  mvn package
}

package() {
  # Install the executables
  install -Dm755 gp-pro "${pkgdir}/usr/bin/gp-pro"
  install -Dm644 "${pkgname}/tool/target/gp.jar" "${pkgdir}/usr/share/java/globalplatformpro/gp.jar"
}
