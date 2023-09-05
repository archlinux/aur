# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libosmscout-git
pkgver=r8205.f9cdeb7
pkgrel=1
arch=(x86_64)
url='https://github.com/Framstag/libosmscout'
license=(LGPL3 custom)
pkgdesc='A C++ library for offline map rendering, routing and location lookup based on OpenStreetMap data'
depends=(
    glew
    glfw-x11
    glm
    marisa
    onetbb
    freetype2
    pango
    zlib
    protobuf
    gcc-libs
    libglvnd
    abseil-cpp
    cairo
    glib2
    libxml2
    glibc
    libpng
    qt6-base
    qt6-5compat
    qt6-declarative
    qt6-multimedia
    qt6-positioning
    qt6-svg
    )
makedepends=(git meson ninja qt6-tools swig)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/Framstag/libosmscout")
sha256sums+=('SKIP')

prepare() {
    cd libosmscout
}

pkgver() {
    cd libosmscout
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake \
        -S "$srcdir/${pkgname%-git}" \
        -B "$srcdir/build" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_VERSION_PREFERRED=6
    cmake --build "$srcdir/build"
}

check() {
    ctest --test-dir "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"

    install -Dm644 libosmscout/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
