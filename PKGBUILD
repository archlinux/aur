# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=wineasio
pkgver=0.9.2
pkgrel=6

pkgdesc="ASIO driver implementation for Wine"
url="http://sourceforge.net/projects/wineasio/"
arch=('i686' 'x86_64')
license=('LGPL')

depends=('wine' 'jack')
depends_x86_64+=('lib32-jack')
makedepends=('ed' 'steinberg-asio')
makedepends_x86_64+=('gcc-multilib')

install="$pkgname".install

source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9fbc2d10a4cec307dc0558bed82b887c864424d16da40a80f1d80f907d92af0b')

prepare() {
  cd "$pkgname"
  cp /usr/include/steinberg-asio/asio.h asio.h
  if [[ "$CARCH" == x86_64 ]]; then
    cp asio.h asio.h.i686
    ./prepare_64bit_asio
  fi
}

build() {
  cd "$pkgname"
  if [[ "$CARCH" == x86_64 ]]; then
    make -f Makefile64
    mv "$pkgname".dll.so "$pkgname".dll.so.x86_64
    cp asio.h.i686 asio.h
    make clean
    make
  else
    make
  fi
}

package() {
  cd "$pkgname"
  if [[ "$CARCH" == x86_64 ]]; then
    install -D -m755 "$pkgname".dll.so.x86_64 "$pkgdir"/usr/lib/wine/"$pkgname".dll.so
    install -D -m755 "$pkgname".dll.so "$pkgdir"/usr/lib32/wine/"$pkgname".dll.so
  else
    install -D -m755 "$pkgname".dll.so "$pkgdir"/usr/lib/wine/"$pkgname".dll.so
  fi
  install -D -m644 README "$pkgdir"/usr/share/"$pkgname"/README
}
# vim:set ts=2 sw=2 et:
