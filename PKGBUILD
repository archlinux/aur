# Maintainer: kekmacska

pkgname=stellastack-git
pkgver=0
pkgrel=1
pkgdesc='Linux astrophotography stacking app with calibration, frame analysis, and FITS/XISF export. Built with C++20 and Qt 6'
arch=('any')
license=('GPL-3.0')
url='https://github.com/paolostivanin/stellastack'
source=("git+$url.git")
makedepends=(cmake make svgo pkgconf git vulkan-headers eigen python)
depends=(
    qt6-base libglvnd
    cfitsio libxml2 lz4 zstd sqlite librtprocess openssl zlib onetbb sep
)
provides=("${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}
    local version commits commit

    version=$(sed -n \
        's/.*project(Stellastack VERSION \([0-9.]*\).*/\1/p' \
        CMakeLists.txt | head -1)

    commits=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short=9 HEAD)

    printf '%s.r%s.g%s\n' "$version" "$commits" "$commit"
}

prepare() {
    cd "$srcdir/${pkgname%-*}"

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass
}

build() {
    cd ${pkgname%-*}

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti \
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
        -DSTELLASTACK_SYSTEM_SEP=ON \
        -DBUILD_SHARED_LIBS=ON

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
