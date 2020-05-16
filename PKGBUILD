# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

pkgname=optimus-manager-qt-git
pkgver=1.5.0.r2.g849bfd5
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url=https://github.com/Shatur95/optimus-manager-qt
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras optimus-manager)
makedepends=(qt5-tools libxrandr git cmake extra-cmake-modules)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
sha256sums=(SKIP)

if [ $_plasma == true ]
then
    depends+=(knotifications kiconthemes)
fi

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Clone submodules
prepare() {
    cd ${pkgname%-git}

    git submodule init
    git submodule update
}

build() {
    mkdir -p ${pkgname%-git}/build
    cd ${pkgname%-git}/build

    if [ $_plasma == true ]
    then
        cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D PLASMA ..
    else
        cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
    fi

    cmake --build .
}

package() {
    cd ${pkgname%-git}/build

    cmake --install .
}
