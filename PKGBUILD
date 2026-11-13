# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=lib32-jansson
_name=jansson
pkgver=2.15.1
pkgrel=2
pkgdesc="C library for encoding, decoding and manipulating JSON data (32-bit)"
arch=(x86_64)
url="https://github.com/akheron/jansson"
license=(MIT)
# jansson: the headers
depends=(jansson lib32-glibc)
provides=(libjansson.so)
source=("https://github.com/akheron/jansson/releases/download/v$pkgver/$_name-$pkgver.tar.gz"{,.asc})
sha512sums=('cb952d51bf0b358f316f36fb925267f3ce7529ef88faca935db73923708269e21733b9682eb64d5478a6d9a3d366b34b42d9b63dd1f510537342c4cc79345740'
  'SKIP')
b2sums=('690b84c8c93a6b1c3be58b5ed030445bf970ab8c8c3cc19b38e0c94df3f33f5fc1a401e5b48785ad1fa5bb534701ac0f85087d9e1ad383a735f56ce27f56fd89'
  'SKIP')
# Petri Lehtinen <petri@digip.org>
validpgpkeys=(B5D6953E6D5059ED7ADA0F2FD3657D24D058434C)

build() {
  cd "$_name-$pkgver" || exit
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

check() {
  cd "$_name-$pkgver" || exit
  make check
}

package() {
  cd "$_name-$pkgver" || exit
  make DESTDIR="$pkgdir" install

  # The headers are jansson's
  rm -r "${pkgdir:?}/usr/include"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
