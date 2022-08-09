# Maintainer: Roland Nagy <roliboy@protonmail.com>
# Contributor: Hao Long <aur@esd.cc>

pkgname=python-cipheycore
pkgver=0.3.2
pkgrel=1
pkgdesc="Some cryptanalysis tidbits written in a proper language"
arch=("any")
url="https://github.com/Ciphey/CipheyCore"
license=("MIT")
makedepends=(
    "gcc"
    "boost"
    "cmake"
    "make"
    "swig"
    "patch"
    "python-setuptools"
    "python-poetry"
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "xor_single.cpp.patch"
)
sha256sums=(
    "d05b4c15077b56121e96c1b934ae2d49f14004834a9b8fbc1bdc76782cd66253"
    "c6c944b824571589ed6fde61943ebc22dc5eb4de0b028ac5920e3a286230701e"
)

build() {
    cd "$srcdir/CipheyCore-$pkgver"
    cd "src/ciphers"
    patch "xor_single.cpp" < "$srcdir/xor_single.cpp.patch"

    cd "$srcdir/CipheyCore-$pkgver"
    rm -rf build
    mkdir build
    cd build

    cmake .. -DCMAKE_BUILD_TYPE=Release -DCIPHEY_CORE_TEST=OFF
    cmake --build . -t ciphey_core

    cmake --build . -t ciphey_core_py --config Release
    poetry build

    cd dist
    tar xf "cipheycore-$pkgver.tar.gz"
    cd "cipheycore-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/CipheyCore-$pkgver/build/dist/cipheycore-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/CipheyCore-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
