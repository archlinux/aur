# Maintainer: Your Name <your.email@example.com>
pkgname=fex-emu-wine-git
pkgver=2510.r13141.ga2ea767b7
pkgrel=1
pkgdesc="FEX DLLs for enabling Wine's ARM64EC support"
arch=('aarch64')
url="https://fex-emu.com"
license=('MIT' 'Apache-2.0' 'BSD-3-Clause' 'GPL-2.0-only')
depends=('systemd-libs')
makedepends=('git' 'cmake' 'clang' 'lld' 'llvm' 'ninja' 'python' 'sed'
             'libepoxy' 'sdl2' 'xxhash' 'alsa-lib' 'libdrm' 'libglvnd'
             'libx11' 'libxrandr' 'openssl' 'wayland' 'zlib')
provides=('fex-emu-wine')
conflicts=('fex-emu-wine')
source=(
    "FEX::git+https://github.com/FEX-Emu/FEX.git#commit=a2ea767b77e5ee07eb1709784fa5d6301d3ba660"
    "https://github.com/bylaws/llvm-mingw/releases/download/20250920/llvm-mingw-20250920-ucrt-ubuntu-22.04-aarch64.tar.xz"
    "Catch2::git+https://github.com/catchorg/Catch2.git#commit=8ac8190"
    "cpp-optparse::git+https://github.com/Sonicadvance1/cpp-optparse.git#commit=9f94388"
    "Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git#commit=cacef30"
    "drm-headers::git+https://github.com/FEX-Emu/drm-headers.git#commit=0675d2f"
    "fmt::git+https://github.com/fmtlib/fmt.git#commit=e424e3f"
    "jemalloc::git+https://github.com/FEX-Emu/jemalloc.git#commit=ce24593"
    "jemalloc-glibc::git+https://github.com/FEX-Emu/jemalloc.git#commit=8436195"
    "range-v3::git+https://github.com/ericniebler/range-v3.git#commit=ca1388f"
    "robin-map::git+https://github.com/FEX-Emu/robin-map.git#commit=d5683d9"
    "tracy::git+https://github.com/wolfpld/tracy.git#commit=650c98e"
    "vixl::git+https://github.com/FEX-Emu/vixl.git#commit=ed690c9"
    "xxhash::git+https://github.com/Cyan4973/xxHash.git#commit=bbb27a5"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/FEX"
    printf "2510.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/FEX"

    # Setup external dependencies
    mkdir -p External/Catch2
    cp -r "$srcdir/Catch2"/* External/Catch2/

    mkdir -p Source/Common/cpp-optparse
    cp -r "$srcdir/cpp-optparse"/* Source/Common/cpp-optparse/

    mkdir -p External/Vulkan-Headers
    cp -r "$srcdir/Vulkan-Headers"/* External/Vulkan-Headers/

    mkdir -p External/drm-headers
    cp -r "$srcdir/drm-headers"/* External/drm-headers/

    mkdir -p External/fmt
    cp -r "$srcdir/fmt"/* External/fmt/

    mkdir -p External/jemalloc
    cp -r "$srcdir/jemalloc"/* External/jemalloc/

    mkdir -p External/jemalloc_glibc
    cp -r "$srcdir/jemalloc-glibc"/* External/jemalloc_glibc/

    mkdir -p External/range-v3
    cp -r "$srcdir/range-v3"/* External/range-v3/

    mkdir -p External/robin-map
    cp -r "$srcdir/robin-map"/* External/robin-map/

    mkdir -p External/tracy
    cp -r "$srcdir/tracy"/* External/tracy/

    mkdir -p External/vixl
    cp -r "$srcdir/vixl"/* External/vixl/

    mkdir -p External/xxhash
    cp -r "$srcdir/xxhash"/* External/xxhash/

    # Fix xxhash CMakeLists.txt for newer CMake versions
    sed -i 's/cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)/cmake_minimum_required (VERSION 3.5 FATAL_ERROR)/' \
        External/xxhash/cmake_unofficial/CMakeLists.txt
}

build() {
    cd "$srcdir/FEX"

    export CFLAGS="-O3 -g -pipe -Wall -Wextra"
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="-Wl,--gc-sections -static"
    export PATH="$srcdir/llvm-mingw-20250920-ucrt-ubuntu-22.04-aarch64/bin:$PATH"

    # Build ARM64EC variant
    mkdir -p build-arm64ec
    cd build-arm64ec

    cmake -GNinja \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CFLAGS" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/wine/aarch64-windows \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_TOOLCHAIN_FILE=../Data/CMake/toolchain_mingw.cmake \
        -DENABLE_LTO=False \
        -DTUNE_CPU=none \
        -DMINGW_TRIPLE=arm64ec-w64-mingw32 \
        -DBUILD_TESTING=False \
        -DENABLE_JEMALLOC_GLIBC_ALLOC=False \
        -DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON \
        ..

    sed -i 's/arm64ec-w64-mingw32-dlltool/llvm-dlltool -m arm64ec/g' build.ninja
    ninja

    cd ..

    # Build WOW64 variant
    mkdir -p build-wow64
    cd build-wow64

    cmake -GNinja \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CFLAGS" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/wine/aarch64-windows \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_TOOLCHAIN_FILE=../Data/CMake/toolchain_mingw.cmake \
        -DENABLE_LTO=False \
        -DTUNE_CPU=none \
        -DMINGW_TRIPLE=aarch64-w64-mingw32 \
        -DBUILD_TESTING=False \
        -DENABLE_JEMALLOC_GLIBC_ALLOC=OFF \
        -DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON \
        ..

    sed -i 's/aarch64-w64-mingw32-dlltool/llvm-dlltool -m arm64/g' build.ninja
    ninja
}

package() {
    cd "$srcdir/FEX"

    # Install ARM64EC build
    cd build-arm64ec
    DESTDIR="$pkgdir" ninja install
    cd ..

    # Install WOW64 build
    cd build-wow64
    DESTDIR="$pkgdir" ninja install
    cd ..

    # Remove unwanted files
    rm -rf "$pkgdir/usr/include"
    rm -rf "$pkgdir/usr/share"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
