pkgname=mingw-w64-libunistring
pkgver=0.9.5
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings. (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libunistring/"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libiconv)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.gz")
md5sums=('1a705bcdcb83799d544137617b377cfd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/libunistring-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-threads=win32
    sed -i "s/deplibs_check_method=.*/deplibs_check_method=pass_all/g" libtool
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libunistring-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
