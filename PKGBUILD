# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mingw-w64-raylib
pkgver=3.0.0
pkgrel=1
pkgdesc="Simple and easy to use game programming library"
arch=(x86_64)
url="https://www.raylib.com"
license=(ZLIB)
groups=()
depends=()
makedepends=(git ninja mingw-w64-gcc mingw-w64-cmake)
replaces=()
backup=()
options=(!strip !buildflags staticlibs)
install=
source=("${pkgname}::git+https://github.com/raysan5/raylib.git#tag=${pkgver}")
noextract=()
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    for _arch in ${_architectures}; do
        mkdir -p "$srcdir/build_${_arch}"
        pushd "$srcdir/build_${_arch}"
        "${_arch}-cmake" "$srcdir/$pkgname" \
            -Wno-dev \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -D CMAKE_INSTALL_LIBDIR=lib \
            -D CMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
            -D USE_EXTERNAL_GLFW=OFF \
            -D BUILD_EXAMPLES=OFF \
            -D BUILD_GAMES=OFF \
            -D SHARED=ON \
            -D STATIC=OFF \
            -D WITH_PIC=ON \
            -G Ninja
        ninja
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" ninja -C "$srcdir/build_${_arch}" install
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
