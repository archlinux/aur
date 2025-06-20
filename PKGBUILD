# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=lib32-jansson
pkgver=2.14.1
pkgrel=1
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=(x86_64)
url=http://www.digip.org/jansson/
license=(MIT)
depends=(
  jansson
  lib32-glibc
)
makedepends=(git)
_tag=684e18c927e89615c2d501737e90018f4930d6c5
source=(git+https://github.com/akheron/jansson.git#tag=v${pkgver})
sha256sums=('42e92703a10414d0c181ef225a84f519c2cfe0ab0094fa820e80e385399b3766')

pkgver() {
  cd jansson

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd jansson

  autoreconf -fiv
}

build() {
  cd jansson

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  make DESTDIR="${pkgdir}" -C jansson install
  rm -rf "${pkgdir}"/usr/{share,include}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s jansson "${pkgdir}"/usr/share/licenses/lib32-jansson
}

# vim: ts=2 sw=2 et:
