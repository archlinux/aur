# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=5.19.0.beta.0.r1.g6622e4c
pkgrel=1
pkgdesc="App and daemon for display managing by KWinFT project, forked from KDE's KScreen"
arch=(
    i686
    x86_64
)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=(
    disman-git
    kdeclarative
    qt5-graphicaleffects
    qt5-sensors
)
makedepends=(
    extra-cmake-modules
    kcmutils
    ninja
    plasma-framework
)
provides=(kdisplay)
conflicts=(kdisplay kscreen)
replaces=(kscreen)
source=("git+https://gitlab.com/kwinft/kdisplay.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/kdisplay"
    
    git describe --long --tags | sed "s/^kdisplay\@//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
    mkdir -p "$srcdir/build"
}

build() {
    cd "$srcdir/build"
    
    cmake \
        "$srcdir/kdisplay" \
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
