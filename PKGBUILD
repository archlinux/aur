# Maintainer: kekmacska

pkgname=veretino-git
pkgver=0.7.0.r38.gbcf6e8d
pkgrel=1
pkgdesc='Folder integrity checker'
arch=('any')
license=('GPL-3.0')
url='https://github.com/artemvlas/veretino'
source=("git+$url.git" "systemlibs.patch")
makedepends=(cmake make svgo pkgconf git vulkan-headers miniz)
depends=(qt6-base qt6-svg libglvnd qmicroz pathstr-git)
provides=("${pkgname%-*}")
sha256sums=('SKIP' '40b471e9f8ebc1280af16bc8e00ab3ba232406ece72d133f3b01c6f35467927c')

pkgver() {
    cd ${pkgname%-*}
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/${pkgname%-*}"

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass

    patch -Np1 -i "$srcdir/systemlibs.patch"
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
        -Wno-author

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
