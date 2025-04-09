# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libdvdcss"
pkgname="lib32-${_name}"
pkgver=1.4.3
pkgrel=3
pkgdesc="Portable abstraction library for DVD decryption (32 bit)"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.bz2::https://download.videolan.org/pub/${_name}/${pkgver}/${_pkgsrc}.tar.bz2")
sha256sums=('233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-doc
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}