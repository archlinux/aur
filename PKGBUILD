# Maintainer: kekmacska

pkgname=falabaac-git
pkgver=2.1.1.r1.g3262e80
pkgrel=1
pkgdesc='Another AAC encoder (git version)'
arch=('any')
url='https://github.com/Sound-Linux-More/falabaac'
license=('MIT')
makedepends=('git' 'make' 'glibc')
provides=('falabaac')
source=('git+https://github.com/Sound-Linux-More/falabaac' 'C23.patch')
sha256sums=('SKIP' '4f7fddd72b9cd793e394f8879b05e50949e0aaa7b2d5fcce0fcc345d4855fc91')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --tags --long --always | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

    #replace mojibake with chinese utf-8
    iconv -f iso-8859-1 -t utf-8 src/frontend/main.c -o src/frontend/main.c
    sed -i 's/ÂÞÁúÖÇ/罗龙志/' src/frontend/main.c

    #patch depracted K&R C getopt function defs according to C23 standards
    patch -Np1 -i "$srcdir/C23.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"

    # Base flags (common to both compilers)
    BASE_CFLAGS="-O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS -fno-rtti -fno-exceptions"
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

    make CC="$CC" CXX="$CXX" -j"$(nproc)"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Install executable
    install -Dm755 falabaac "$pkgdir/usr/bin/falabaac"

    # Install shared library (rename .so.2 → .so)
    install -Dm755 libfalabaac.so.2 "$pkgdir/usr/lib/libfalabaac.so"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install man page
    install -Dm644 man/man1/falabaac.1 "$pkgdir/usr/share/man/man1/falabaac.1"

    # Install headers
    install -Dm644 src/include/*.h -t "$pkgdir/usr/include/falabaac"
}
