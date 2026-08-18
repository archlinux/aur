# Maintainer: kekmacska

pkgname=culo-git
pkgver=0.r249.g816757a
pkgrel=1
pkgdesc="ncurses-less terminal editor with nano keybindings. extremely fast and small, mostly compatible with nano syntax highlighting"
arch=('x86_64')
url="https://github.com/rofl0r/culo"
license=('BSD-2-Clause')
makedepends=('git' 'make')
provides=('culo')

source=(
    "culo::git+https://github.com/rofl0r/culo.git"
    "nano-syntax::git+https://github.com/galenguyer/nano-syntax-highlighting.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/culo"
    printf "%s.r%s.g%s" \
        "0" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/culo"

    mkdir -p syntax

    # Copy vendored nano syntax files ONLY if missing
    for f in "$srcdir/nano-syntax"/*.nanorc; do
        dest="syntax/$(basename "$f")"
        [[ -e "$dest" ]] || cp "$f" "$dest"
    done
}

build() {
    cd "$srcdir/culo"

    BASE_CFLAGS="-O3 -march=znver4 -mtune=znver4 \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math -ffast-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
            -fstrict-vtable-pointers -fno-asynchronous-unwind-tables \
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

    make -j$(nproc)
}

package() {
    cd "$srcdir/culo"

    # executable
    install -Dm755 culo "$pkgdir/usr/bin/culo"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
