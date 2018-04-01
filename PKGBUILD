# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=globalplatformpro-git
pkgver=0.3.10rc8.r2.g2c67f83
pkgrel=1
pkgdesc="A powerful tool for managing applets and keys on JavaCards based on the GlobalPlatform specifications"
arch=('any')
url="https://javacard.pro/globalplatform/"
license=('LGPL3')
depends=('java-environment' 'pcsclite')
makedepends=('git' 'apache-ant')
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
