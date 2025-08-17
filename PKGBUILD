# Maintainer: aquova <mail at aquova dot net>

pkgname=firelight
pkgver=0.10.1
pkgrel=1
pkgdesc="A libretro-based frontend"
arch=("x86_64")
url="https://github.com/firelight-emulator/firelight"
license=("GPL3")
depends=(
    "cpr"
    "ffmpeg"
    "libarchive"
    "nlohmann-json"
    "qt6-base"
    "qt6-tools"
    "sdl2"
    "vulkan-headers"
)
makedepends=(
    "cmake"
    "clang"
    "clang-tools-extra"
    "gettext"
    "git"
    "gtest"
    "ninja"
    "spdlog"
)
source=(
    "firelight::git+${url}.git#tag=v${pkgver}"
    "firelight.desktop"
)
sha256sums=(
    "SKIP"
    "3cdb9183d4c875831ccd0dd859ffa915fc8d64032d076aefa0f8cf8d88e8f0b3"
)

prepare() {
    cd $srcdir/firelight
    git submodule update --init --recursive
}

build() {
    local cmake_options=(
        -B "build"
        -G Ninja
        -S "firelight"
        -D CMAKE_C_COMPILER="clang"
        -D CMAKE_CXX_COMPILER="clang++"
        -D CMAKE_BUILD_TYPE="Release"
        --fresh
    )
    cmake "${cmake_options[@]}"
    cmake --build "build"
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/firelight.desktop -t $pkgdir/usr/share/applications
    install -Dm644 $srcdir/firelight/assets/img/firelight_logo.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
    install -Dm755 $srcdir/firelight/lib/discord_social_sdk/lib/release/libdiscord_partner_sdk.so -t $pkgdir/usr/lib/firelight

    cd $srcdir/build
    install -Dm755 firelight -t $pkgdir/opt/$pkgname
    cp -r system $pkgdir/opt/$pkgname
    rm -r $pkgdir/opt/$pkgname/system/_cores/windows # Remove Windows cores to keep size down

    echo "#!/usr/bin/env bash
    cd /opt/$pkgname
    ./firelight" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
