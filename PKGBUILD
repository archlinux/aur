# Maintainer: aquova <mail at aquova dot net>

pkgname=ymir-emu
pkgver=0.2.0
pkgrel=4
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
    "35458feda17c3b8d7d8b66f87f6f8e01462b6146b1c85c7c9a7d048dbb5bd722"
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
    install -Dm644 $srcdir/ymir/apps/ymir-sdl3/res/ymir.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
