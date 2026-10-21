# Maintainer: Blaadick <null>

_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

pkgname="mingw-w64-yyjson"
pkgver="0.13.0"
pkgrel=2
pkgdesc="A high performance C JSON library (mingw-w64)"
arch=("any")
url="https://github.com/ibireme/yyjson"
license=("MIT")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!strip" "!buildflags" "staticlibs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ibireme/yyjson/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("6447bbb50d18a4e0d57ac3232bd23eed7f94a16cff781d4779d28c81833b8de7566e730f827f1e7e6d60a06fcbbdc41fd581a1f872901391f7a09288bb93fd40")

build() {
    cd "yyjson-$pkgver"

    for _arch in ${_architectures}; do
        $_arch-cmake -S . -B "build-$_arch" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DYYJSON_BUILD_TESTS=OFF -DYYJSON_BUILD_DOC=OFF
        cmake --build "build-$_arch"
    done
}

package() {
    cd "yyjson-$pkgver"

    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" cmake --install "build-$_arch"

        find "$pkgdir/usr/$_arch" -name '*.dll' -exec "$_arch-strip" --strip-unneeded {} +
        find "$pkgdir/usr/$_arch" -name '*.dll.a' -exec "$_arch-strip" -g {} +
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
