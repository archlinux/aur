# Maintainer: kekmacska

pkgname=markdown-tools-git
pkgver=0.17.15.r1.g028b85622
pkgrel=1
pkgdesc='Qt tools for work with Markdown (Editor/Viewer/Converter) with deep KDE integration'
arch=('any')
license=('GPL-3.0')
url='https://github.com/igormironchik/markdown-tools'
source=("git+$url.git")
makedepends=(cmake make svgo oxipng pkgconf git extra-cmake-modules vulkan-headers doctest)
depends=(qt6-base libglvnd kwidgetsaddons kiconthemes kcolorscheme kconfig tinyxml2 syntax-highlighting expat icu freetype2 fontconfig libpng libjpeg-turbo libwebp harfbuzz zlib)
provides=("${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/${pkgname%-*}"

    git submodule update --init --recursive

    # we use arch's build
    rm -rf 3rdparty/doctest

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass
    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 src
}

build() {
    cd ${pkgname%-*}

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing \
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
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 installer/packages/mironchik.igor.markdown/data/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
