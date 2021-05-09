# Maintainer: novenary <streetwalkermc@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=blackmagic
pkgname=$_pkgname-git
pkgver=1.7.1.r195.gcfbe9f1
pkgrel=1
pkgdesc='In application debugger for ARM Cortex microcontrollers'
arch=('x86_64')
url='https://github.com/blacksphere/blackmagic'
license=('GPL')
depends=('libusb' 'libftdi' 'libhidapi-libusb.so')
makedepends=('git' 'hidapi' 'python')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's| -Werror||' $_pkgname/src/Makefile
}

build() {
  cd $_pkgname

  make PROBE_HOST=hosted
}

package() {
  cd $_pkgname

  install -Dm 755 src/blackmagic "$pkgdir"/usr/bin/blackmagic

  install -Dm 644 driver/99-blackmagic.rules "$pkgdir"/usr/lib/udev/rules.d/99-blackmagic.rules
}
