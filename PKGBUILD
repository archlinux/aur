# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-recode
pkgver=3.7.13
pkgrel=1
pkgdesc="Converts files between various character sets and usages (mingw-w64)"
arch=('any')
url='https://github.com/rrthomas/recode'
license=('GPL3' 'LGPL3')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure' 'mingw-w64-wine' 'python' 'help2man')
source=("https://github.com/rrthomas/recode/releases/download/v${pkgver}/recode-${pkgver}.tar.gz"
        "autotools.patch"
        "help2man.patch")
sha256sums=('22bbdf79725a59f4d84c3dad63a911c5e8f443f109443c032cad564900b6b733'
            '49d6019103484d4b81188d7eba39f35704a0a92049cdcb0b086e53c134595f1b'
            'ca789328432b01ebe066ca594ac611ca43bd19083ed499e88c4410b15cc8492a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/recode-${pkgver}

  autoreconf -fi
  libtoolize

  patch -Np1 -i ${srcdir}/autotools.patch
  patch -Np1 -i ${srcdir}/help2man.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/recode-${pkgver}/build-${_arch} && cd ${srcdir}/recode-${pkgver}/build-${_arch}
    ${_arch}-configure \
      --mandir=/usr/${_arch}/share/man \
      --infodir=/usr/${_arch}/share/info \
      --without-included-gettext
    make -j1
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/recode-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"

    ${_arch}-strip -s "${pkgdir}/usr/${_arch}"/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
