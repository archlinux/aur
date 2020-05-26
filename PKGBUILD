# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdisplay-git
pkgver=r1278.6622e4c
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
    plasma-framework
    kcmutils
)
provides=(kdisplay)
conflicts=(kdisplay kscreen)
replaces=(kscreen)
source=("git+https://gitlab.com/kwinft/kdisplay.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/kdisplay"
    
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
