# Maintainer: Blaadick <null>

_architectures=("i686-w64-mingw32" "x86_64-w64-mingw32")

pkgname="mingw-w64-spirv-cross"
pkgver="2021.01.15"
pkgrel=2
pkgdesc="A tool and library for parsing and converting SPIR-V to other shader languages (mingw-w64)"
arch=("any")
url="https://github.com/KhronosGroup/SPIRV-Cross/"
license=("Apache")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=("!strip" "!buildflags" "staticlibs")
source=("https://github.com/KhronosGroup/SPIRV-Cross/archive/${pkgver//./-}.tar.gz")
sha256sums=("d700863b548cbc7f27a678cee305f561669a126eb2cc11d36a7023dfc462b9c4")

build() {
    cd "SPIRV-Cross-${pkgver//./-}"

    for _arch in ${_architectures[@]}; do
        $_arch-cmake \
            -B "build-$_arch" \
            -S . \
            -DCMAKE_BUILD_TYPE=Release \
            -DSPIRV_CROSS_SHARED=ON \
            -DSPIRV_CROSS_CLI=OFF \
            -DCMAKE_POLICY_VERSION_MINIMUM=3.5

        cmake --build "build-$_arch" --parallel
    done
}

package() {
    cd "SPIRV-Cross-${pkgver//./-}"

    for _arch in ${_architectures[@]}; do
        cmake --install "build-$_arch" --prefix "$pkgdir/usr/$_arch"
    done
}
