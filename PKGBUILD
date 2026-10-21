# Maintainer: Blaadick <null>

_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

pkgname="mingw-w64-imageinfo"
pkgver="2.0.0"
pkgrel=2
pkgdesc="Cross platform super fast single header c++ library to get image size and format without loading/decoding (mingw-w64)"
arch=("any")
url="https://github.com/xiaozhuai/imageinfo"
license=("MIT")
makedepends=("mingw-w64-cmake")
options=("!strip" "!buildflags")
source=("$pkgname-$pkgver.tar.gz::https://github.com/xiaozhuai/imageinfo/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("ab19e5d9e2add87f435a9cf73601cb90d5dac1ebdaca60f631a6bdb41dd5568d3aa057106273bbd1c5eda2fc5643548e275def7165498bcb69652eb0ee3db978")

build() {
    cd "imageinfo-$pkgver"

    for _arch in ${_architectures}; do
        $_arch-cmake -S . -B "build-$_arch" -DCMAKE_BUILD_TYPE=Release -DIMAGEINFO_BUILD_TESTS=OFF -DIMAGEINFO_BUILD_CLI=OFF
        cmake --build "build-$_arch"
    done
}

package() {
    cd "imageinfo-$pkgver"

    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" cmake --install "build-$_arch"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
