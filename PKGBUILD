# Maintainer: kekmacska

_srcname=ManPageEditorQT
pkgname=manpageeditor-qt-git
pkgver=0.4.0.r7.gd623dfd
pkgrel=1
pkgdesc='A manpage editor for QT'
arch=('any')
license=('GPL-3.0')
url='https://keithdhedger.github.io/pages/manpageeditorqt/manpageeditorqt.html'
source=('git+https://github.com/KeithDHedger/ManPageEditorQT.git')
makedepends=(make autoconf oxipng)
depends=(qt6-base aspell)
provides=(manpageeditor-qt)
sha256sums=('SKIP')

pkgver() {
  cd $_srcname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$srcdir/$_srcname"
    oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 .
}

build() {
    cd $_srcname

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
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -flto -fno-plt"

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

    sh autogen.sh --prefix=/usr && make -j$(nproc)
}

package() {
    cd $_srcname
    make DESTDIR="$pkgdir" install

    printf "\033[38;5;208mMake sure to install aspell dictionaries for your desired language!\033[0m\n"
}
