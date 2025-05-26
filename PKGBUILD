# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conitrbutor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="tesseract"
pkgname="lib32-${_name}"
pkgver=5.5.1
pkgrel=1
pkgdesc="An OCR program (32-bit)"
arch=('x86_64')
url="https://tesseract-ocr.github.io"
_url="https://github.com/tesseract-ocr/${_name}"
license=('Apache-2.0')
depends=('lib32-curl' 'lib32-gcc-libs' 'lib32-glibc' 'lib32-leptonica>=1.74'
         'lib32-libarchive' "${_name}>=${pkgver}")
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${_name}_only_target_libraries.patch")
sha256sums=('a7a3f2a7420cb6a6a94d80c24163e183cf1d2f1bed2df3bbc397c81808a57237'
            'cebf0b3f6768ad483ad224f3b7d12ebfcb9a6002828d8133e85d14d4129bfd2c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_only_target_libraries.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
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
  rm -rf "bin" "include" "share"
}
