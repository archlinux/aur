pkgname=mingw-w64-libunistring
pkgver=0.9.9
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings. (mingw-w64)"
arch=(any)
url="https://www.gnu.org/software/libunistring/"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libiconv)
options=(staticlibs !strip !buildflags)
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz"{,.sig})
sha256sums=('a4d993ecfce16cf503ff7579f5da64619cee66226fb3b998dafb706190d9a833'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno <ueno@gnu.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/libunistring-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-threads=win32
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libunistring-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/share/info/dir"
  done
}
