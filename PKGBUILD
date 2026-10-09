# Maintainer: kekmacska

pkgname=sep
pkgver=1.4.1.r1.g93b3ac5
pkgrel=1
pkgdesc='Python and C library for source extraction and photometry'
arch=('any')
license=('MIT, LGPL, BSD')
url='https://github.com/sep-developers/sep'
source=("git+$url.git" "sep.1" "https://raw.githubusercontent.com/paolostivanin/stellastack/refs/heads/main/vendor/sep/stellastack-fixes.patch") # since it is mainly meant for stellastack, we vendor their patches and apply them
makedepends=(cmake make pkgconf git xz)
provides=($pkgname)
options=('!zipman')
sha256sums=('SKIP' '63b41608372b36cebc37cbc00fe9daa707b5ef5f0651d7394d90055646761aaf' 'ff84117efbb7a20f3a1d77e5258e086afbab3c11cf124ddd0bc76d31e3523e84')

pkgver() {
    cd $pkgname

    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd $pkgname
    patch -Np1 -i "$srcdir/stellastack-fixes.patch"
}

build() {
    cd $pkgname

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
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-author

    cmake --build build --parallel "$(nproc)"
}

check() {
    cd $pkgname
    make test
}

package(){
    cd "$srcdir/$pkgname"

    DESTDIR="$pkgdir" cmake --install build

    xz -9 -e -c "$srcdir/$pkgname.1" > "$srcdir/$pkgname.1.xz"

    # Install manpage
    install -Dm644 "$srcdir/$pkgname.1.xz" "$pkgdir/usr/share/man/man1/$pkgname.1.xz" # it is vendored because pkgbuild can't compile it due to python dependency hell

    # Install licenses
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 licenses/* "$pkgdir/usr/share/licenses/$pkgname/"
}
