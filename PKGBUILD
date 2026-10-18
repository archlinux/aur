# Maintainer: kekmacska

pkgname=ant-renamer-qt-git
pkgver=3.0.0.rc.15.r3.gb5afaec
pkgrel=1
pkgdesc='C++/Qt 6 port of Ant Renamer 2.13: batch file renaming (replace, enumerate, case, regex, EXIF, MP3 tags)'
arch=('any')
license=('GPL-2.0')
url='https://github.com/morfredus/ant-renamer-qt'
source=("git+$url.git" "shared.patch")
makedepends=(cmake make pkgconf git vulkan-headers)
depends=(qt6-base libglvnd)
provides=("${pkgname%-*}")
sha256sums=('SKIP' '5e966bb76eb469f163c54ce8e38a9cc3d9df11d5d7b75012a7dc4867a46d8035')

pkgver() {
    cd "$srcdir/${pkgname%-*}"

    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd ${pkgname%-*}

    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 .

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
            -fstrict-aliasing -fno-rtti \
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
    ./build/test_core || true # this might not always succeed
    ./build/app/test_panel
}

package() {
    cd "$srcdir/${pkgname%-*}"

    # 1. Install the executable
    install -Dm755 build/app/antrenamer-qt "${pkgdir}/usr/bin/antrenamer-qt"

    # 2. Install the shared library
    install -Dm755 build/librencore.so "${pkgdir}/usr/lib/librencore.so"

    # 3. Install the desktop file
    install -Dm644 scripts/linux/antrenamer-qt.desktop "${pkgdir}/usr/share/applications/antrenamer-qt.desktop"

    # 4. Install the 48x48 icon
    install -Dm644 app/antrenamer-qt.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/antrenamer-qt.png"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
