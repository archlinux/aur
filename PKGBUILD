# Author:      Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor:  redtide <redtid3@gmail.com>
# Contributor:  Matthew Bakhtiari <contact@altf2.dev>
# Maintainer: Kazel <address at domain dot tld>

pkgname=wineasio
pkgver=1.1.0
pkgrel=7

pkgdesc="ASIO driver implementation for Wine"
url="https://github.com/wineasio/wineasio"
arch=('x86_64')
license=('LGPL')

depends=('jack' 'lib32-jack' 'python-pyqt5' 'realtime-privileges' 'wine')
makedepends=('gcc')

install="$pkgname".install

source=(
  "https://github.com/wineasio/wineasio/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'aa26ec986878d3fee1b99d0b31d0085379a78fcace20defbaf9627f007e2f2cc'
)

prepare(){
  # Adjust PREFIX value in script files
  sed -i "s?X-PREFIX-X?\/usr?" $pkgname-$pkgver/gui/wineasio-settings
}

build() {
  cd "$pkgname-$pkgver"
  make 32
  make 64
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 build32/"$pkgname".dll.so "$pkgdir"/usr/lib32/wine/i386-unix/"$pkgname".dll.so
  install -D -m644 build32/"$pkgname".dll "$pkgdir"/usr/lib32/wine/i386-windows/"$pkgname".dll
  install -D -m755 build64/"$pkgname".dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/"$pkgname".dll.so
  install -D -m644 build64/"$pkgname".dll "$pkgdir"/usr/lib/wine/x86_64-windows/"$pkgname".dll
  install -D -m755 gui/wineasio-settings "$pkgdir"/usr/bin/wineasio-settings
  install -D -m644 gui/settings.py "$pkgdir"/usr/share/"$pkgname"/settings.py
  install -D -m644 gui/ui_settings.py "$pkgdir"/usr/share/"$pkgname"/ui_settings.py
  install -D -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md
}
# vim:set ts=2 sw=2 et:
