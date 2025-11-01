# Maintainer: aquova <mail at aquova dot net>

pkgname=ymir-emu
pkgver=0.2.0
pkgrel=3
pkgdesc="Sega Saturn Emulator"
arch=("x86_64")
url="https://github.com/StrikerX3/Ymir"
license=("GPL3")
depends=("sdl3")
makedepends=("cmake" "clang" "git" "ninja" "python-jinja" "unzip" "zip")
provides=($pkgname)
conflicts=($pkgname)
source=(
    "ymir::git+${url}.git#tag=v${pkgver}"
    ymir-emu.desktop
    v0.2.0.patch # Fixed in b2ef0f52e1666335fc95e56c1fe0ebae086cd175 but needs to be applied to the 0.2.0 release
)
sha256sums=(
    "SKIP"
    "60aa8a14977ebe5a4510c20a9da6bf31a86bb6525e50692d8d0cf71d515c6bd8"
    "9fafa7633fc4349ccb7ef5b2dac126f11ea2c2ae4c0a0d855b87bb5cf2638592"
)

prepare() {
    cd $srcdir/ymir
    patch -uN apps/ymir-sdl3/src/util/std_lib.cpp $srcdir/v0.2.0.patch
    git submodule update --init --recursive
}

build() {
    export CC=clang
    export CXX=clang++
    cd $srcdir/ymir
    local cmake_options=(
        -S .
        -B build
        -G Ninja
        -D CMAKE_C_COMPILER=clang
        -D CMAKE_CXX_COMPILER=clang++
        -D CMAKE_MAKE_PROGRAM=ninja
        -D CMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake
        -D Ymir_AVX2=ON
        -D Ymir_ENABLE_TESTS=OFF
        -D Ymir_ENABLE_DEVLOG=OFF
        -D Ymir_ENABLE_IMGUI_DEMO=OFF
        -D Ymir_ENABLE_SANDBOX=OFF
        --fresh
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    cd $srcdir/ymir
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 $srcdir/ymir-emu.desktop -t ${pkgdir}/usr/share/applications
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
