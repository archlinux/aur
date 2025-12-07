# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="voxelcore"
pkgver=0.30.6
pkgrel=1
pkgdesc="Minecraft-like game engine in C++ with OpenGL"
url="https://github.com/MihailRis/$pkgname"
license=("custom")
arch=('x86_64')
options=("lto" "strip" "!debug")
depends=("gcc-libs" "bash" "glibc" "hicolor-icon-theme" "libglvnd" "zlib" "glfw" "glew" "glm" "libpng" "libvorbis" "openal" "luajit" "curl")
makedepends=("cmake" "sed" "entt")
source=(
    "$url/archive/refs/tags/v$pkgver.zip"
    "voxelcore.sh"
)
sha256sums=("4e89329be2c3d9893e85d3cbe69d484c3eb9cd269f2a39e5a5f2c882048c23a8"
            "9766b3fcdd35932709d9f8f7bd8c322d139f830440eb649bdff9a45cc14ef02e")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Desktop file patching to run custom launch script that installed in system (check voxelcore.sh for more details)
    sed -i 's|Exec=VoxelEngine|Exec=voxelcore|' "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

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
