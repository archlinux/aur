# Maintainer: aquova <mail at aquova dot net>

pkgname=firelight
pkgver=0.12.2
pkgrel=2
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
    "spdlog"
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
)
source=(
    "firelight::git+${url}.git#tag=v${pkgver}"
    "firelight.desktop"
    "CMakeLists.patch" # Temporary fix for Qt 6.10
)
sha256sums=(
    "SKIP"
    "3cdb9183d4c875831ccd0dd859ffa915fc8d64032d076aefa0f8cf8d88e8f0b3"
    "6a0582ad0469c7b898c6d46e35fa8b9eb3c8345274381071ec2f4ef53267eac1"
)

prepare() {
    cp CMakeLists.patch $srcdir/firelight
    cd $srcdir/firelight
    git apply CMakeLists.patch
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
    install -Dm755 $srcdir/firelight/lib/discord_social_sdk/lib/release/libdiscord_partner_sdk.so -t $pkgdir/usr/lib
    install -Dm644 $srcdir/firelight/LICENSE.txt -t $pkgdir/usr/share/licenses/firelight

    cd $srcdir/build
    install -Dm755 firelight -t $pkgdir/opt/$pkgname
    cp -r system $pkgdir/opt/$pkgname

    echo "#!/usr/bin/env bash
    cd /opt/$pkgname
    ./firelight" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
