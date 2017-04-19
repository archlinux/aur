# Maintainer: swiftgeek

pkgname=8189fs-git
_pkgname=rtl8189ES_linux
pkgver=a
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8189FTV SDIO wireless devices."
arch=('armv7h')
url="https://github.com/swiftgeek/rtl8189ES_linux/tree/rtl8189fs"
license=('GPL')
depends=('linux')
makedepends=('linux-headers' 'git')
source=("git://github.com/swiftgeek/$_pkgname.git#branch=rtl8189fs")
sha256sums=('SKIP')
install=depmod.install

_extramodules="$(basename $(readlink -f /lib/modules/$(uname -r)/extramodules/))"

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_pkgname"
  make ARCH=arm KSRC="/usr/lib/modules/$(uname -r)/build/"
  #gzip -9 8189fs.ko
}

package() {
  install -d "$pkgdir/usr/lib/modules/${_extramodules}/"
  install -m644 "$srcdir/$_pkgname/8189fs.ko" \
    "$pkgdir/usr/lib/modules/${_extramodules}/8189fs.ko"
}

# vim:set ts=2 sw=2 et:
