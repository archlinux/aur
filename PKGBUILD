# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Matthias Blaicher <matthias at blaicher dot com>

pkgname=disman-git
pkgver=r1538.0c6de05
pkgrel=1
pkgdesc='Qt/C++ display management library by KWinFT project ~ forked from KDE libkscreen'
arch=(
    i686
    x86_64
)
url='https://gitlab.com/kwinft/disman'
license=(LGPL)
depends=(
    qt5-x11extras
    libxrandr
    kwayland
    wrapland
)
makedepends=(
    extra-cmake-modules
    git
)
provides=(disman)
conflicts=(disman)
source=('git+https://gitlab.com/kwinft/disman.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/disman"
    
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "$srcdir/build"
}

build() {
    cd "$srcdir/build"
    
    cmake \
        "$srcdir/disman" \
        -G Ninja \
        -D CMAKE_BUILD_TYPE="Release" \
        -D CMAKE_INSTALL_PREFIX="/usr" \
        -D KDE_INSTALL_LIBDIR="lib" \
        -D KDE_INSTALL_LIBEXECDIR="lib" \
        -D KDE_INSTALL_USE_QT_SYS_PATHS="ON" \
        -D BUILD_TESTING="OFF"
    
    ninja
}

package() {
    cd "$srcdir/build"
    
    DESTDIR="$pkgdir" ninja install
}
