# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libidn
pkgver=1.35
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libidn"
license=("GPL3, LGPL")
makedepends=('gettext' 'autoconf-archive' 'mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libidn/libidn-${pkgver}.tar.gz"
        "0002-fix-gdoc.all.patch"
        "0003-nfkc.c-Fix-Win64-crash.patch"
        "0004-nfkc.c-Fixed-invalid-var-types.patch")
sha256sums=('f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e'
            '02d9b9e6e3f966cff2d4d763c0de9219da6c8cf444248011caa8eb2fb3067a24'
            '6293c730a98af32a337149a95d848f3c4619df8dc367e0bf0251a509b09f5963'
            '2a2c45dc6f595705a226687c8954390baf926e135168e1919baeadef5e5478cc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  
  cd "${srcdir}"/libidn-${pkgver}

  patch -p1 -i ${srcdir}/0002-fix-gdoc.all.patch
  patch -p1 -i ${srcdir}/0003-nfkc.c-Fix-Win64-crash.patch
  patch -p1 -i ${srcdir}/0004-nfkc.c-Fixed-invalid-var-types.patch
  
  autopoint --force
  autoreconf -i
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
