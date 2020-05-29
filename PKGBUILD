# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Author: Matthias Blaicher <matthias at blaicher dot com>

pkgname=disman-git
pkgver=0.519.0.beta.0.r6.g231fc34
pkgrel=1
pkgdesc='Qt/C++ display management library by KWinFT project ~ forked from KDE libkscreen'
arch=(
    i686
    x86_64
)
url='https://gitlab.com/kwinft/disman'
license=(LGPL)
depends=(
    kwayland
    libxrandr
    qt5-x11extras
    wrapland
)
makedepends=(
    extra-cmake-modules
    git
    ninja
)
provides=(disman)
conflicts=(disman)
source=('git+https://gitlab.com/kwinft/disman.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/disman"
    
    git describe --long --tags | sed "s/^disman\@//;s/\([^-]*-g\)/r\1/;s/-/./g"
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
