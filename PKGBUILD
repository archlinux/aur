# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.21
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
_tag=d24faf56214469b354b01c8ba36257e04737101e
source=(git+https://github.com/jedisct1/libsodium.git#tag=${_tag})
b2sums=('fdc16dc401d4f4461fcb9befd6b8744b352e39b6e7613d0db3fc90785d758d22921f91cb912995e04ff1a7708c8a2356398b610cdbde0bc0ddd6de95d3dcb664')

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
