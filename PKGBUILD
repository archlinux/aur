# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=mingw-w64-raylib
pkgver=5.5
pkgrel=1
pkgdesc="Simple and easy to use game programming library (mingw-w64)"
arch=(any)
url="https://www.raylib.com"
license=(ZLIB)
groups=()
depends=(mingw-w64-crt mingw-w64-glfw)
makedepends=(ninja mingw-w64-cmake)
replaces=()
backup=()
options=(!strip !buildflags staticlibs)
install=
source=(
    "raylib_${pkgver}.tar.gz::https://github.com/raysan5/raylib/archive/refs/tags/${pkgver}.tar.gz"
)
noextract=()
md5sums=(
    61638c4c2c097fbca1d6a71e4da36c16
)
sha256sums=(
    aea98ecf5bc5c5e0b789a76de0083a21a70457050ea4cc2aec7566935f5e258e
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "$srcdir/raylib-${pkgver}"
}

build() {
    for _arch in ${_architectures}; do
        mkdir -p "$srcdir/build_${_arch}"
        pushd "$srcdir/build_${_arch}"
        "${_arch}-cmake" "$srcdir/raylib-${pkgver}" \
            -Wno-dev \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
            -D USE_EXTERNAL_GLFW=ON \
            -D BUILD_EXAMPLES=OFF \
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
