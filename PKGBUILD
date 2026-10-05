# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="voxelcore"
pkgver=0.32.1
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
    "entt-3.16.0::git+https://github.com/skypjack/entt.git#tag=v3.16.0"
    "voxelcore.sh"
)
sha256sums=(
    "ab72ef6748e80365d6c84a6f6272484b4417f4447096364beb7314cb2ce30eec"
    "de25424025094e6a0bff5dadd16893d5f0158d68ca4691d2e43643c2176f6d06"
    "9766b3fcdd35932709d9f8f7bd8c322d139f830440eb649bdff9a45cc14ef02e"
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Desktop file patching to run custom launch script that installed in system (check voxelcore.sh for more details)
    sed -i 's|Exec=VoxelEngine|Exec=voxelcore|' "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop"

    # EnTT detection fix
    sed -i 's|find_package(EnTT REQUIRED)|find_package(EnTT CONFIG REQUIRED)\ntarget_link_libraries(VoxelEngineSrc PRIVATE EnTT::EnTT)|' "$srcdir/$pkgname-$pkgver/src/CMakeLists.txt"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Prepare old entt v3.16.0
    cd "$srcdir/entt-3.16.0"
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DENTT_INSTALL=ON \
        -DCMAKE_INSTALL_PREFIX="$srcdir/entt-prefix" \
        -S . -B ./build
    cmake --build ./build
    cmake --install ./build

    # Build voxelcore
    cd "$srcdir/voxelcore-$pkgver"
    mkdir -p build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH="$srcdir/entt-prefix" \
        -S . -B ./build
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
