# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="voxelcore"
pkgver=0.32.3
pkgrel=1
pkgdesc="Minecraft-like game engine in C++ with OpenGL"
url="https://github.com/MihailRis/$pkgname"
license=("custom")
arch=('x86_64')
options=("lto" "strip" "!debug")
depends=("gcc-libs" "bash" "glibc" "libgcc" "libstdc++" "hicolor-icon-theme" "libglvnd" "zlib" "glfw" "glew" "glm" "libpng" "libvorbis" "openal" "luajit" "curl" "freetype2" "openssl")
makedepends=("cmake" "sed")
source=(
    "$pkgname-$pkgver::git+https://github.com/MihailRis/voxelcore.git#tag=v$pkgver"
    "voxelcore.sh"
)
sha256sums=(
    "5bf12bdd62b5a403576646e917a2a9f1eb4643d35dbb8691c3b750b98e6b6006"
    "b74faf05a669b42e743c39b62eb65078c86ae67beb06477901787a8cffd2c62c"
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Desktop file patching to run custom launch script that installed in system (check voxelcore.sh for more details)
    sed -i 's|Exec=VoxelCore|Exec=voxelcore|' "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop"

    # Add EnTT to CMake as dependency
    sed -i 's|find_package(EnTT REQUIRED)|include(FetchContent)\n    FetchContent_Declare(\n        EnTT\n        GIT_REPOSITORY https://github.com/skypjack/entt.git\n        GIT_TAG        v3.16.0\n    )\n    FetchContent_MakeAvailable(EnTT)\n    target_link_libraries(VoxelCoreSrc PRIVATE EnTT::EnTT)|' "$srcdir/$pkgname-$pkgver/src/CMakeLists.txt"
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
        --exe "$srcdir/$pkgname-$pkgver/build/VoxelCore" \
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
    install -m 755 "$srcdir/$pkgname-$pkgver/build/VoxelCore" "$pkgdir/usr/bin/VoxelCore"
    install -m 755 "$srcdir/voxelcore.sh" "$pkgdir/usr/bin/voxelcore"

    # Game res
    cp -r "$srcdir/$pkgname-$pkgver/build/res/"* "$pkgdir/usr/share/VoxelCore/res"

    # Desktop file
    install -m 644 "$srcdir/$pkgname-$pkgver/dev/VoxelCore.desktop" "$pkgdir/usr/share/applications/VoxelCore.desktop"
}
