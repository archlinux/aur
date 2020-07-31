# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-recode
pkgver=3.7.7
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
sha256sums=('0946f63b706719e6aa74ea5c0c2276c265ca1ced2cb44e05f2b5654c0e7f38fb'
            '4f431b274c5bba1f00325285c59825032c35893da61a539439d605839d8e906c'
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
