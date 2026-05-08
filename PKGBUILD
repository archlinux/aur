# Maintainer: aquova <mail at aquova dot net>

pkgname=ymir-emu
pkgver=0.3.1
pkgrel=1
pkgdesc="Sega Saturn Emulator"
arch=("x86_64")
url="https://github.com/StrikerX3/Ymir"
license=("GPL3")
depends=("sdl3")
makedepends=("autoconf" "autoconf-archive" "automake" "cmake" "clang" "git" "libtool" "ninja" "python-jinja" "unzip" "zip")
provides=($pkgname)
conflicts=($pkgname)
source=(
    "ymir::git+${url}.git#tag=v${pkgver}"
    ymir-emu.desktop
)
sha256sums=(
    "SKIP"
    "f5e56bef2d099a16ea07863e0d24e348d534f18927961090c16f82c953400acc"
)

prepare() {
    cd $srcdir/ymir
    git submodule update --init --recursive
}

build() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS

    export VCPKG_BINARY_SOURCES="clear"

    cd $srcdir/ymir
    local cmake_options=(
        -S .
        -B build
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_C_COMPILER=clang
        -D CMAKE_CXX_COMPILER=clang++
        -D CMAKE_MAKE_PROGRAM=ninja
        -D CMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake
        -D Ymir_ENABLE_TESTS=OFF
        -D Ymir_ENABLE_DEVLOG=OFF
        -D Ymir_ENABLE_IMGUI_DEMO=OFF
        -D Ymir_ENABLE_SANDBOX=OFF
        --fresh
    )
    cmake "${cmake_options[@]}"
    cmake --build build --parallel
}

package() {
    cd $srcdir/ymir
    install -Dm755 $srcdir/ymir/build/apps/ymir-sdl3/ymir-sdl3 -t $pkgdir/usr/bin
    install -Dm755 $srcdir/ymir/build/apps/ymdasm/ymdasm -t $pkgdir/usr/bin
    install -Dm644 $srcdir/ymir-emu.desktop -t ${pkgdir}/usr/share/applications
    install -Dm644 $srcdir/ymir/apps/ymir-sdl3/res/ymir.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
