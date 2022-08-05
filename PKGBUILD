# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-gsm
pkgver=1.0.22
pkgrel=1
pkgdesc="Shared libraries for GSM 06.10 lossy speech compression (mingw-w64)"
arch=('any')
url="https://www.quut.com/gsm/"
license=('custom')
options=(!strip !buildflags staticlibs)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
source=("https://www.quut.com/gsm/gsm-${pkgver}.tar.gz"
        'makefile.patch'
        'win32.patch')
sha512sums=('f4284f096ed4d606ddece5c1b28edb63feacc26a0b664f1350c040dbf50113d27bedfd9896bf1620cb4fc3a6c8f6a5244955a6c625ded833dcee607c63c97dd2'
            '70110a5368a602b9f04ea4fc184eaf7af7da33e8d7403ed382c41822d8ba32387aca60b1c3d0aa506a5e1a38ac940ddacdf5cbb64348ee51378bfe4eecec0288'
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
