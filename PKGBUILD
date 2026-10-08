# Maintainer: kekmacska

pkgname=amber-git
pkgver=1.7.10.r11.g2f8329f93
pkgrel=1
pkgdesc='Amber Video Editor — free open-source non-linear video editor (Qt 6, FFmpeg, Qt RHI: Vulkan/Metal/D3D/OpenGL)'
arch=('any')
license=('GPL-3.0')
url='https://github.com/baptisterajaut/amber'
source=("git+$url.git" "ffmpegversion.patch")
makedepends=(cmake make svgo oxipng pkgconf git vulkan-headers doxygen)
depends=(qt6-base qt6-multimedia qt6-svg qt6-shadertools libglvnd ffmpeg libsm libice libx11 libxext libxkbcommon)
provides=("${pkgname%-*}")
sha256sums=('SKIP' '3edaddca3928316bdd18b8630bd7991ddb8be7844108c320735f99c944f60d8d')

pkgver() {
    cd ${pkgname%-*}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/${pkgname%-*}/src"

    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 .

    patch -Np1 -i "$srcdir/ffmpegversion.patch"
}

build() {
    cd ${pkgname%-*}/src

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-exceptions \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections -fvisibility=hidden"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=share/man \
        -DCMAKE_INSTALL_DATAROOTDIR=share \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DQT_NO_PRIVATE_MODULE_WARNING=ON

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}/src"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
