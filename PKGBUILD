# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

set -u
pkgname=tesseract
pkgver=5.5.5
pkgrel=1
pkgdesc='An OCR program'
pkgdesc+=' (32-bit)'
arch=(x86_64)
#url="https://tesseract-ocr.github.io"
_url="https://github.com/tesseract-ocr/tesseract"
url="https://github.com/tesseract-ocr/tesseract"
license=('Apache-2.0')
depends=(
  curl
  gcc-libs
  glibc
  libarchive
  'leptonica>=1.74'
)
depends=("${depends[@]/#/lib32-}")
depends+=("${pkgname}>=${pkgver}")
provides=("lib${pkgname}.so=${pkgver}")
options=('!debug')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_only_target_libraries.patch")
sha256sums=('b02cf6f37cfc95be5bf7e4b2d39e51997b1ac41f7beb4e2bd16777bb67561c79'
            'cebf0b3f6768ad483ad224f3b7d12ebfcb9a6002828d8133e85d14d4129bfd2c')

_name="${pkgname}"
pkgname="lib32-${pkgname}"

prepare() {
  cd "${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_only_target_libraries.patch"
}

build() {
  cd "${_pkgsrc}"

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

if [ ! -s 'configure' ]; then
  ./autogen.sh
fi
if [ ! -s 'Makefile' ]; then
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-doc
fi
  make
}

package() {
  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
set +u
