# Maintainer: kekmacska

pkgname=pawmmit-git
pkgver=0.1.2.r90.g583a748b
pkgrel=1
pkgdesc='Pawmmit is a fast, native Git client focused on performance, usability and safe history handling'
arch=('any')
license=('GPL-3.0')
url='https://github.com/Pawmmit/Pawmmit'
source=('git+https://github.com/Pawmmit/Pawmmit.git')
makedepends=(meson ninja cmake svgo pkgconf git)
depends=(qt6-base qt6-5compat libgit2 libssh2 luajit hunspell cmark qscintilla-qt6) # the project seems to vendor zip and lua-lpeg
provides=(pawmmit)
sha256sums=('SKIP')

pkgver() {
  cd Pawmmit
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/Pawmmit"

    svgo . -r --multipass
    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 .
}

build() {
    cd Pawmmit

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

    meson setup \
        --prefix /usr \
        --libexecdir lib \
        --sbindir bin \
        --buildtype plain \
        --auto-features enabled \
        -D b_pie=true \
        -D python.bytecompile=1 \
        build

    ninja -C build
}

package(){
    cd "$srcdir/Pawmmit"
    meson install -C build --destdir "$pkgdir"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
