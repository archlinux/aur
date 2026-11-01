# Maintainer: Blaadick <null>

pkgname="mingw-w64-bsu"
pkgdesc="Blaad's System Utilities (mingw-w64)"
url="https://github.com/Blaadick/BSU"
license=("GPL-3.0-or-later")
pkgver="0.1.1"
pkgrel=1
arch=("any")
depends=(
    "mingw-w64-crt"
    "mingw-w64-gcc"
)
makedepends=(
    "mingw-w64-cmake"
    "ninja"
)
options=("!strip" "!buildflags" "staticlibs")
source=("bsu-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("1f626792a5a87e0586f944a8985339377abda7bdbda205f1bfe43005eaae49ebccaf049a3476bc945ca393182e8037649c5e65fe3fde9b5f8a0c1ecbf98f15c9")

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

build() {
    cd "BSU-$pkgver"

    for _arch in "${_architectures[@]}"; do
        "$_arch-cmake" -B "cmake-build-release-$_arch" -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
        cmake --build "cmake-build-release-$_arch" --parallel
    done
}

package() {
    cd "BSU-$pkgver"

    for _arch in "${_architectures[@]}"; do
        DESTDIR="$pkgdir" cmake --install "cmake-build-release-$_arch"
        "$_arch-strip" --strip-unneeded "$pkgdir/usr/$_arch/bin/"*.dll
        "$_arch-strip" -g "$pkgdir/usr/$_arch/lib/"*.a
    done
}
