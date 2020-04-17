# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-gsm
pkgver=1.0.19
pkgrel=1
pkgdesc="Shared libraries for GSM 06.10 lossy speech compression (mingw-w64)"
arch=('any')
url="http://www.quut.com/gsm/"
license=('custom')
options=(!strip !buildflags staticlibs)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
source=("http://www.quut.com/gsm/gsm-${pkgver}.tar.gz"
        'makefile.patch'
        'win32.patch')
sha512sums=('f69b4bf2d918b118b5de90b8ab88fd026008ac7432f07b872b81fe52cdc781f605dca8eedcdaebc8beb974cef388496c618f92a41961c62057009964159f8392'
            '79c4b3b1e47da433fcb057124f592ca5233a8bf549ea6f30df09e74042421f64c9875c3750b88d153f3383eb7cf44204d275ae83e2ea9ed55ecaae899e4c8156'
            '4f0c1c4a02fbc390efd399f8873c7604aa73a9325be1944ee9f60e31b759a4beb48b500b6ef269e592dd67f03e197534d2bc15d94ddef3c8c3a141256e2c138f')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gsm-${pkgver%.*}-pl${pkgver##*.}/"

  patch -Np1 -i "${srcdir}/makefile.patch"
  patch -Np1 -i "${srcdir}/win32.patch"
}

build() {
  for _arch in ${_architectures}; do
    cp -r ${srcdir}/gsm-${pkgver%.*}-pl${pkgver##*.} ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    make -f Makefile.mingw64 \
      CC=${_arch}-gcc \
      AR=${_arch}-ar \
      RANLIB=${_arch}-ranlib
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    # Prepare directories
    install -m755 -d ${pkgdir}/usr/${_arch}/{bin,lib,include/gsm,share/{licenses/gsm,man/man{1,3}}}

    unset LDFLAGS CPPFLAGS
    make -f Makefile.mingw64 \
      CC="${_arch}-gcc" \
      AR=${_arch}-ar \
      RANLIB=${_arch}-ranlib \
      INSTALL_ROOT=${pkgdir}/usr/${_arch} \
      GSM_INSTALL_INC=${pkgdir}/usr/${_arch}/include/gsm \
      GSM_INSTALL_MAN=${pkgdir}/usr/${_arch}/share/man/man3 \
      TOAST_INSTALL_MAN=${pkgdir}/usr/${_arch}/share/man/man1 \
      install

    # Install license
    install -m644 COPYRIGHT ${pkgdir}/usr/${_arch}/share/licenses/gsm/license.txt

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    rm -r ${pkgdir}/usr/${_arch}/share/man
  done
}
