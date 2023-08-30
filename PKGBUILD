# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libosmscout-git
pkgver=r8192.cbc50ff
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
    qt6-5compat
    cairo
    glib2
    libxml2
    glibc
    libpng
    qt6-base
    qt6-declarative
    qt6-multimedia
    qt6-svg
    )
makedepends=(git meson ninja qt6-tools swig)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=(
    "git+https://github.com/Framstag/libosmscout"
    0001-dont-install-tests.patch
    0002-dont-install-demos.patch
    )
sha256sums+=('SKIP'
             'e8c23c7f25e1930a7b67487eb654b1bb8e769278fe998b0b7142ffd0e42dda26'
             'b3bd0ad3ad13b25cf955cbd150819ca247b743656a59b6536d80ecaeac9e8f3e')

prepare() {
    cd libosmscout
    patch -Np1 -i ../0001-dont-install-tests.patch
    patch -Np1 -i ../0002-dont-install-demos.patch
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
