# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libstemmer"
pkgname="lib32-${_name}"
pkgver=2.2.0
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
        'dynamiclib.diff')
sha256sums=('425cdb5fba13a01db59a1713780f0662e984204f402d3dae1525bda9e6d30f1a'
            'c031da5a11bafa079df6c33b38b8795b65cf2c91cc6b452dcf2b10612288a3e6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/dynamiclib.diff"
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
