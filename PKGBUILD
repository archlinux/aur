# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-gsm
pkgver=1.0.23
pkgrel=1
pkgdesc="Shared libraries for GSM 06.10 lossy speech compression (mingw-w64)"
arch=('any')
url="https://www.quut.com/gsm/"
license=('LicenseRef-custom')
options=(!strip !buildflags staticlibs !debug)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
source=("https://www.quut.com/gsm/gsm-${pkgver}.tar.gz"
        'makefile.patch'
        'win32.patch')
sha512sums=('96a477f7f4a2ad8319d97c4010e3e2ddb453fa6eda44dac83a62f060a3e6790cc0298d3f402eab52e1a7c0f5c001ab793baefd1fc876ff6432efeb506981bdd8'
            'a01d0cf36896729582ec28189bfbefa83c28cea55b8ee65ab35094731c6c2661bc747e3ae0f59c022925902cc0d2c00a5d23680c2c18e3291d8283329ff0d2fb'
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
    install -m755 -d ${pkgdir}/usr/${_arch}/{bin,lib,include/gsm,share/man/man{1,3}}
    install -m755 -d ${pkgdir}/usr/share/licenses/mingw-w64-gsm

    unset LDFLAGS CPPFLAGS
    make -j 1 -f Makefile.mingw64 \
      CC="${_arch}-gcc" \
      AR=${_arch}-ar \
      RANLIB=${_arch}-ranlib \
      INSTALL_ROOT=${pkgdir}/usr/${_arch} \
      GSM_INSTALL_INC=${pkgdir}/usr/${_arch}/include/gsm \
      GSM_INSTALL_MAN=${pkgdir}/usr/${_arch}/share/man/man3 \
      TOAST_INSTALL_MAN=${pkgdir}/usr/${_arch}/share/man/man1 \
      install

    # Install license
    install -m644 COPYRIGHT ${pkgdir}/usr/share/licenses/mingw-w64-gsm/license.txt

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

    # Fix permissions
    chmod 644 "${pkgdir}/usr/${_arch}/lib/libgsm.dll.a"

    rm -r ${pkgdir}/usr/${_arch}/share/man
    rmdir ${pkgdir}/usr/${_arch}/share
  done
}
