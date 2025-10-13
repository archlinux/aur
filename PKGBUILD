# Maintainer: aquova <mail at aquova dot net>

pkgname=iris-emu
pkgver=0.15a
_pkgver=0.15-alpha
pkgrel=1
pkgdesc="Experimental PlayStation 2 Emulator"
arch=("x86_64")
url="https://github.com/allkern/iris"
license=("MIT")
makedepends=("clang" "cmake" "git")
source=(
    "iris::git+${url}.git#tag=${_pkgver}"
    "iris-emu.desktop"
)
sha256sums=(
    "SKIP"
    "6dfc8a9ccf3229c52dea374de1697e2dc1084fcc237bc632d2a7c58246610304"
)

prepare() {
    cd $srcdir/iris
    git submodule update --init --recursive
}

build() {
    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
    local cmake_options=(
        -B build
        -S .
        -D CMAKE_C_COMPILER="clang"
        -D CMAKE_CXX_COMPILER="clang++"
        -D CMAKE_BUILD_TYPE="Release"
        --fresh
    )
    cd $srcdir/iris
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    install -Dm644 $srcdir/iris-emu.desktop -t $pkgdir/usr/share/applications
    install -Dm755 $srcdir/iris/build/iris $pkgdir/usr/bin/iris-emu
    install -Dm644 $srcdir/iris/res/iris.png $pkgdir/usr/share/pixmaps/iris-emu.png
}
