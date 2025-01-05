# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conitrbutor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="tesseract"
pkgname="lib32-${_name}"
pkgver=5.5.0
pkgrel=1
pkgdesc="An OCR program (32-bit)"
arch=('x86_64')
url="https://tesseract-ocr.github.io"
_url="https://github.com/tesseract-ocr/${_name}"
license=('Apache-2.0')
depends=('lib32-curl' 'lib32-gcc-libs' 'lib32-glibc' 'lib32-leptonica'
         'lib32-libarchive' "${_name}")
makedepends=('lib32-icu>=52.1' 'lib32-pango>=1.38')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f2fb34ca035b6d087a42875a35a7a5c4155fa9979c6132365b1e5a28ebc3fc11')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
