# Maintainer: kekmacska

pkgname=pathstr-git
pkgver=r22.gad0373f4b
pkgrel=1
pkgdesc='A small library for handling filesystem paths as strings for Qt'
arch=('any')
license=('MIT')
url='https://github.com/artemvlas/pathstr'
source=("git+$url.git" "shared.patch")
makedepends=(cmake make git)
provides=("${pkgname%-*}")
sha256sums=('SKIP' '6d85d12243dd53dca7481a6415b66377fa69e68b15ab8e9970ff25f288487055')

pkgver() {
    cd "$srcdir/${pkgname%-*}"

    commits=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short=9 HEAD)

    printf 'r%s.g%s\n' "$commits" "$commit"
}

prepare() {
    cd ${pkgname%-*}
    patch -Np1 -i "$srcdir/shared.patch"
}

build() {
    cd ${pkgname%-*}

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections"

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

check() {
    cd ${pkgname%-*}
    ./build/test_pathstr
}

package() {
    cd "$srcdir/${pkgname%-*}"

    # shared libary
    install -Dm755 build/libpathstr.so "$pkgdir/usr/lib/libpathstr.so"

    # sources
    install -d "$pkgdir/usr/include"
    install -m644 pathstr.* "$pkgdir/usr/include/"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
