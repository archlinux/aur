pkgname="mingw-w64-libde265"
pkgver="1.1.1"
pkgrel=1
pkgdesc="Open h.265 video codec implementation (mingw-w64)"
arch=("any")
url="https://github.com/strukturag/libde265"
license=("LGPL3")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!buildflags" "staticlibs" "!strip")
source=("https://github.com/strukturag/libde265/releases/download/v$pkgver/libde265-$pkgver.tar.gz")
sha512sums=("7ecc2fc2d20bc85f2a117c16562e1abd6ad9ec92785f65dfb15a5c7038687b64ae885ad31d31beaf2fa5471b4ce4dbfee98191db9457b2a6b14eabda8c483cad")

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

build() {
    cd "libde265-$pkgver"

    for _arch in ${_architectures[@]}; do
        $_arch-cmake \
            -B "build-$_arch" \
            -S . \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_POLICY_VERSION_MINIMUM=3.5

        cmake --build "build-$_arch" --parallel
    done
}

package () {
    cd "libde265-$pkgver"

    for _arch in ${_architectures[@]}; do
        cmake --install "build-$_arch" --prefix "$pkgdir/usr/$_arch"
    done
}
