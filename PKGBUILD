# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.20
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
_tag=9511c982fb1d046470a8b42aa36556cdb7da15de
source=(git+https://github.com/jedisct1/libsodium.git#tag=${_tag})
b2sums=('d67cf311966660f71ff010e058f08a84fa27998c463be263808848de6954ac020c0eb793fa28be7d3b9d5b099a6607680f129f00968e4a231e4eaec7bd5f12f4')

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
