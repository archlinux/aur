# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=mingw-w64-libosmscout-git
pkgver=r8254.d82b2ae
pkgrel=1
arch=($CARCH)
url='https://github.com/Framstag/libosmscout'
license=(LGPL3 custom)
pkgdesc='A C++ library for offline map rendering, routing and location lookup based on OpenStreetMap data (mingw-w64)'
depends=(
    mingw-w64-qt6-base
    mingw-w64-qt6-5compat
    mingw-w64-qt6-declarative
    mingw-w64-qt6-multimedia
    mingw-w64-qt6-positioning
    mingw-w64-qt6-svg
    qt6-tools
    )
makedepends=(git meson ninja)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=('git+https://github.com/Framstag/libosmscout'
        '001-link-with-ws3_32.patch')
sha256sums+=('SKIP'
             'faf9cd117f1a452b7591b18bb5834086c64a371e9d4e3b4c36d69f32e57a13f8')
# Build fails with `buildflags` because ld.exe doesn't recognize `-z`
options=(!buildflags !strip)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
    cd libosmscout
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/libosmscout"

    # https://stackoverflow.com/a/64456041
    patch -Np1 -i ../001-link-with-ws3_32.patch
}

build() {
    for _arch in ${_architectures}; do
        # harfbuzz doesn't work, so disable it for now.
        # cairo depends on Pango and that depends internally on harfbuzz, so disable it also.
        # The import lib isn't needed for the cross build and it doesn't build anyway, because of how protobuf is found.
        # https://github.com/protocolbuffers/protobuf/issues/12292
        # Tests need the import lib - disable them.
        # libgdiplus is not available.
        $_arch-cmake \
            -S "$srcdir/libosmscout" \
            -B "$srcdir/build-$_arch" \
            -DCMAKE_DISABLE_FIND_PACKAGE_harfbuzz=ON \
            -DCMAKE_DISABLE_FIND_PACKAGE_Pango=ON \
            -DOSMSCOUT_BUILD_IMPORT=OFF \
            -DOSMSCOUT_BUILD_TESTS=OFF \
            -DOSMSCOUT_BUILD_MAP_GDI=OFF \
            -DOSMSCOUT_BUILD_DOC_API=OFF \
            -DQT_VERSION_PREFERRED=6
        cmake --build "$srcdir/build-$_arch"
    done
}

package() {
    for _arch in ${_architectures}; do
        DESTDIR="$pkgdir" cmake --install build-$_arch
    done

    install -Dm644 libosmscout/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
