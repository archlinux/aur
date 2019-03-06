# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-recode
pkgver=3.7.1
pkgrel=1
pkgdesc="Converts files between various character sets and usages (mingw-w64)"
arch=('any')
url='https://github.com/rrthomas/recode'
license=('GPL3' 'LGPL3')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure' 'python')
source=("https://github.com/rrthomas/recode/releases/download/v${pkgver}/recode-${pkgver}.tar.gz"
        "autotools.patch"
        "help2man.patch")
sha256sums=('da1195fce1d1c2887bc32108b4ef4ae09b7bcbe90e87f4f20390c20ca4832508'
            '596e9f287935406b8d68f24ffe999ad3a15e3e81702505745f57b2b05e63b22f'
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
