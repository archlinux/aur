# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libstemmer"
pkgname="lib32-${_name}"
pkgver=3.0.1
pkgrel=1
pkgdesc="Stemming library supporting several languages (32-bit)"
arch=('x86_64')
url="https://snowballstem.org"
_url="https://github.com/snowballstem/snowball"
license=('BSD-3-Clause')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
_pkgsrc="snowball-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-Make-libstemmer-a-shared-library.patch')
sha256sums=('80ac10ce40dc4fcfbfed8d085c457b5613da0e86a73611a3d5527d044a142d60'
            '8d9440992704d9fbe359eaceef53436d55011bed234e84bc6453c38a62b8f036')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/0001-Make-libstemmer-a-shared-library.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgsrc}"
  make "${_name}.so.0"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${_name}.so.0" "${pkgdir}/usr/lib32/${_name}.so.0.0.0"

  cd "${pkgdir}/usr/lib32"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
