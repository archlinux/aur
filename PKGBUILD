# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=libosmscout-git
pkgver=r8217.74095f1
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
source=("git+https://github.com/Framstag/libosmscout"
        '0001-dont-install-demos-and-tests.patch')
sha256sums=('SKIP'
            '7228c3d78463504148d5808d642167519466eb4269b41db767924e9602bfbd78')
prepare() {
    cd libosmscout

    patch -Np1 -i ../0001-dont-install-demos-and-tests.patch
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
        -DOSMSCOUT_BUILD_DOC_API=OFF \
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
