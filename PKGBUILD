# Maintainer: kekmacska

pkgname=remora-git
pkgver=2026.10.0.r0.g6e96135
pkgrel=1
pkgdesc='Run Android apps on your Linux desktop. Android 16 and 17 (LineageOS 23 / 24) in a Docker container, GPU-accelerated on NVIDIA, Intel and AMD, with every app in a window of its own'
arch=('any')
license=('GPL-3.0')
url='https://github.com/EtherAura/Remora'
source=("git+$url.git")
makedepends=(cmake make svgo pkgconf git vulkan-headers ffnvcodec-headers)
depends=(qt6-base qt6-webengine qt6-webchannel qt6-positioning qt6-declarative qt6-multimedia libglvnd ffmpeg android-sdk-platform-tools docker)
provides=("${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
    cd Remora
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/Remora"

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass
}

build() {
    cd Remora

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
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
        -DBUILD_SHARED_LIBS=ON

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/Remora"

    DESTDIR="$pkgdir" cmake --install build
}
