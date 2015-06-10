# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-gsm
pkgver=1.0.13
pkgrel=8
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
md5sums=('c1ba392ce61dc4aff1c29ea4e92f6df4'
         '1f17f4c181769a091891092e1fdc1e3c'
         'bb2919748d4ed7eb3174af976126f501')
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

    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    rm ${pkgdir}/usr/${_arch}/bin/*.exe
    rm -r ${pkgdir}/usr/${_arch}/share/man
  done
}
