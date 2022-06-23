# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libidn
pkgver=1.40
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (mingw-w64)"
arch=(any)
url="https://www.gnu.org/software/libidn"
license=("GPL3, LGPL")
makedepends=('gettext' 'autoconf-archive' 'mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=(staticlibs !strip !buildflags)
source=("https://ftp.gnu.org/gnu/libidn/libidn-${pkgver}.tar.gz"
        "0003-nfkc.c-Fix-Win64-crash.patch"
        "0004-nfkc.c-Fixed-invalid-var-types.patch")
sha256sums=('527f673b8043d7189c056dd478b07af82492ecf118aa3e0ef0dc98c11af79991'
            '6293c730a98af32a337149a95d848f3c4619df8dc367e0bf0251a509b09f5963'
            '8ae6ad9513fc11bd79cb1ab73f187cb8297bdabd21a2aef3b6526ca17810eda9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {  
  cd "${srcdir}"/libidn-${pkgver}

  patch -p1 -i ${srcdir}/0003-nfkc.c-Fix-Win64-crash.patch
  patch -p1 -i ${srcdir}/0004-nfkc.c-Fixed-invalid-var-types.patch
}

build() {
  cd "${srcdir}/libidn-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-csharp \
      --disable-java \
      --disable-rpath \
      --disable-gtk-doc \
      --enable-threads=win32 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libidn-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
