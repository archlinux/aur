# Maintainer: Blaadick <null>

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

pkgname="mingw-w64-nlohmann-json"
pkgver="3.12.0"
pkgrel=4
pkgdesc="Header-only JSON library for Modern C++ (mingw-w64)"
url="https://github.com/nlohmann/json"
license=("MIT")
arch=("any")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!buildflags" "!strip" "staticlibs")
source=("https://github.com/nlohmann/json/archive/v${pkgver}.tar.gz")
sha256sums=("4b92eb0c06d10683f7447ce9406cb97cd4b453be18d7279320f7b2f025c10187")

build() {
    cd "json-$pkgver"

    for _arch in ${_architectures[@]}; do
        $_arch-cmake \
            -B "build-$_arch" \
            -S . \
            -DCMAKE_BUILD_TYPE=Release \
            -DJSON_BuildTests=OFF \
            -DJSON_MultipleHeaders=ON

        cmake --build "build-$_arch" --parallel
    done
}

package() {
    cd "json-$pkgver"

    for _arch in ${_architectures[@]}; do
        cmake --install "build-$_arch" --prefix "$pkgdir/usr/$_arch"
    done
}
