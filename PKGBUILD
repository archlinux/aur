# Author:      Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor:  redtide <redtid3@gmail.com>
# Contributor:  Matthew Bakhtiari <contact@altf2.dev>
# Maintainer: Kazel <address at domain dot tld>

pkgname=wineasio
pkgver=1.3.0
pkgrel=2

pkgdesc="ASIO driver implementation for Wine"
url="https://github.com/wineasio/wineasio"
arch=('x86_64')
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')

options=('!lto' '!debug')
depends=('jack' 'python-pyqt5' 'realtime-privileges' 'wine')
makedepends=('gcc')

install="$pkgname".install

source=(
  "https://github.com/wineasio/wineasio/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'f8bf74c871233f65e5befecc7b4f2629f2566f84e951e363af0ad51eae516a4c'
)

prepare(){
  # Adjust PREFIX value in script files
  sed -i "s?X-PREFIX-X?\/usr?" $pkgname-$pkgver/gui/wineasio-settings
}

build() {
  cd "$pkgname-$pkgver"
  make 64
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 build64/"$pkgname"64.dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/"$pkgname"64.dll.so
  install -D -m644 build64/"$pkgname"64.dll "$pkgdir"/usr/lib/wine/x86_64-windows/"$pkgname"64.dll
  install -D -m755 gui/wineasio-settings "$pkgdir"/usr/bin/wineasio-settings
  install -D -m644 gui/settings.py "$pkgdir"/usr/share/"$pkgname"/settings.py
  install -D -m644 gui/ui_settings.py "$pkgdir"/usr/share/"$pkgname"/ui_settings.py
  install -D -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md
  install -D -m755 wineasio-register "$pkgdir"/usr/bin/wineasio-register
}
# vim:set ts=2 sw=2 et:
