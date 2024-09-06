# Maintainer: lvrodrigues <lvrodriguesline@gmail.com>

arch=('x86_64')
_platform="$arch-w64-mingw32"
_name=libunistring

pkgname=mingw-w64-$arch-$_name
pkgver=1.2
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings for amd64 platform (mingw-w64)"
url="https://www.gnu.org/software/libunistring/"
license=('LGPL-3.0-only')
depends=(mingw-w64-$arch-libiconv)
makedepends=('mingw-w64-gcc')
provides=("$pkgname=$pkgver")
conflicts=("mingw-w64-$_name")
options=('!strip' 'staticlibs' '!buildflags')
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-$pkgver.tar.xz"{,.sig})
sha256sums=('632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44'
            'SKIP')
validpgpkeys=('9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D') # Bruno Haible (Open Source Development) <bruno@clisp.org>

prepare() {
    cd "$srcdir/$_name-$pkgver"
    ./configure --build=x86_64-pc-linux-gnu \
        --host=$_platform --prefix=/usr/$_platform \
        --enable-threads=windows
}

build() {
    cd "$srcdir/$_name-$pkgver"
    make
}

package() {
    cd "$srcdir/$_name-$pkgver"
    make  DESTDIR="$pkgdir" install
    find  "$pkgdir/usr/$_platform" -name '*.exe' | xargs -rtL1 rm
    find  "$pkgdir/usr/$_platform" -name '*.dll' | xargs -rtL1 $_platform-strip -x
    find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 $_platform-strip -g
	find  "$pkgdir/usr/$_platform" -name '*.a' -o -name '*.dll' | xargs -rtL1 chmod 644
    rm -r "$pkgdir/usr/$_platform/share"     
}

# build() {
#   cd "${srcdir}/libunistring-${pkgver}"
#   for _arch in ${_architectures}; do
#     mkdir -p build-${_arch} && pushd build-${_arch}
#     ${_arch}-configure \
#       --enable-threads=win32
#     make DESTDIR="${srcdir}/install-${_arch}" install
#     popd
#   done
# }

# package() {
#   for _arch in ${_architectures}; do
#     cd "${srcdir}"
#     cp -r "install-${_arch}/"* "${pkgdir}"
#     find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
#     find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
#     rm "${pkgdir}/usr/${_arch}/share/info/dir"
#   done
# }
