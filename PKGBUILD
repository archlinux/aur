# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="voxelcore"
pkgver=0.32.2
pkgrel=1
pkgdesc="Minecraft-like game engine in C++ with OpenGL"
url="https://github.com/MihailRis/$pkgname"
license=("custom")
arch=('x86_64')
options=("lto" "strip" "!debug")
depends=("gcc-libs" "bash" "glibc" "hicolor-icon-theme" "libglvnd" "zlib" "glfw" "glew" "glm" "libpng" "libvorbis" "openal" "luajit" "curl" "freetype2")
makedepends=("cmake" "sed")
source=(
    "$pkgname-$pkgver::git+https://github.com/MihailRis/voxelcore.git#tag=v$pkgver"
    "voxelcore.sh"
)
sha256sums=(
    "6a696c6a94eeeff3fe2a5d82c8a5d449e80d64fff7704c01e930bcb300e3726b"
    "9766b3fcdd35932709d9f8f7bd8c322d139f830440eb649bdff9a45cc14ef02e"
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Desktop file patching to run custom launch script that installed in system (check voxelcore.sh for more details)
    sed -i 's|Exec=VoxelEngine|Exec=voxelcore|' "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop"

    # Add EnTT to CMake as dependency
    sed -i 's|find_package(EnTT REQUIRED)|include(FetchContent)\n    FetchContent_Declare(\n        EnTT\n        GIT_REPOSITORY https://github.com/skypjack/entt.git\n        GIT_TAG        v3.16.0\n    )\n    FetchContent_MakeAvailable(EnTT)\n    target_link_libraries(VoxelEngineSrc PRIVATE EnTT::EnTT)|' "$srcdir/$pkgname-$pkgver/src/CMakeLists.txt"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build voxelcore
    cd "$srcdir/voxelcore-$pkgver"
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release -S . -B ./build
    cmake --build build -j$(nproc)
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build/vctest"

    "$srcdir/$pkgname-$pkgver/build/vctest/vctest" \
        --exe "$srcdir/$pkgname-$pkgver/build/VoxelEngine" \
        --res "$srcdir/$pkgname-$pkgver/build/res" \
        --tests "$srcdir/$pkgname-$pkgver/dev/tests"
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/VoxelCore/res"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

    # Icon
    install -m 644 "$srcdir/$pkgname-$pkgver/dev/VoxelCore.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/VoxelCore.png"

    # Game binary & launcher
    install -m 755 "$srcdir/$pkgname-$pkgver/build/VoxelEngine" "$pkgdir/usr/bin/VoxelEngine"
    install -m 755 "$srcdir/voxelcore.sh" "$pkgdir/usr/bin/voxelcore"

    # Game res
    cp -r "$srcdir/$pkgname-$pkgver/build/res/"* "$pkgdir/usr/share/VoxelCore/res"

    # Desktop file
    install -m 644 "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop" "$pkgdir/usr/share/applications/VoxelCore.desktop"
}
