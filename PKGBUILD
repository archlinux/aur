# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.22
pkgrel=1
pkgdesc='A modern, portable, easy to use crypto library'
arch=(x86_64)
url='https://github.com/jedisct1/libsodium'
license=(custom:ISC)
depends=(
  lib32-glibc
  libsodium
)
makedepends=(git)
provides=('libsodium.so')
_tag=bc5892beb87c388e123baa7c8f4862f30d9206a7
source=(git+https://github.com/jedisct1/libsodium.git#tag=${_tag})
b2sums=('6711197c82da7bfaf6afd5e2a9895c28fb070325adfec7d0b687d9185febf217fadb18422ce397f3d39ee8b2b563685950fb5ee13d5d3e25e6a56ba81ca7fc82')

prepare() {
  cd libsodium
  ./autogen.sh
}

pkgver() {
  cd libsodium
  git describe --tags | sed 's/-RELEASE//'
}

build() {
  cd libsodium
  export CC='gcc -m32'
  export PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd libsodium
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libsodium "${pkgdir}"/usr/share/licenses/lib32-libsodium
}

# vim:set ts=2 sw=2 et:
