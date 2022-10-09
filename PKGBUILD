# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=mingw-w64-libsquish-fixed-tables
pkgver=1.15
pkgrel=2
pkgdesc="DXT compression library with Rich Geldreich's fixed solid color lookup tables (mingw-w64)"
arch=(any)
url="https://sourceforge.net/projects/libsquish"
license=("MIT")
makedepends=('mingw-w64-cmake' 'ninja')
depends=(mingw-w64-libpng)
provides=('mingw-w64-libsquish')
conflicts=('mingw-w64-libsquish')
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/libsquish/libsquish-$pkgver.tgz"
        "gcc440.patch"
        "0001-fix-install.patch"
        "fixed_solid_color_lookup_tables.patch")
sha256sums=('628796eeba608866183a61d080d46967c9dda6723bc0a3ec52324c85d2147269'
            'c49fa616dcb1aa8eee523c20b70dd442358e051202091294686345daeb1d7352'
            '7ec7f612ac18a3dbade20e9ed1d7de36ad0abbec59c8147a6e5144fa03728dc7'
            'f489515ba5ba8aed12876becdc82201041bb54b5be0b05dbd3c0b9e907290cfc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  patch -Np0 -i "${srcdir}"/gcc440.patch
  patch -Np1 -i "${srcdir}"/0001-fix-install.patch
  patch -Np1 -i "${srcdir}"/fixed_solid_color_lookup_tables.patch
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S "${srcdir}" -B build/${_arch}-static -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF

    ${_arch}-cmake -S "${srcdir}" -B build/${_arch} -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SQUISH_EXTRA=ON

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
