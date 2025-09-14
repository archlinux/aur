# Maintainer: aquova <mail at aquova dot net>

pkgname=ymir-emu
_pkgname=ymir
pkgver=0.1.8
pkgrel=1
pkgdesc="Sega Saturn Emulator"
arch=("x86_64")
url="https://github.com/StrikerX3/Ymir"
license=("GPL3")
depends=("sdl3")
makedepends=("cmake" "clang" "git" "ninja")
source=(
    "ymir::git+${url}.git#tag=v${pkgver}"
    ymir-emu.desktop
)
sha256sums=(
    "SKIP"
    "60aa8a14977ebe5a4510c20a9da6bf31a86bb6525e50692d8d0cf71d515c6bd8"
)

prepare() {
    cd $srcdir/ymir
    git submodule update --init --recursive
}

build() {
    local cmake_options=(
        -B "build"
        -S "ymir"
        -D CMAKE_C_COMPILER="clang"
        -D CMAKE_CXX_COMPILER="clang++"
        -D Ymir_AVX2=ON
        -D Ymir_ENABLE_DEVLOG=OFF
        -D Ymir_ENABLE_IMGUI_DEMO=OFF
        -G Ninja
        --fresh
    )
    cmake "${cmake_options[@]}"
    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 ymir-emu.desktop -t ${pkgdir}/usr/share/applications
    install -Dm644 "ymir/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
