# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

pkgname=optimus-manager-qt-git
pkgver=1.4.5.r11.g23e75f6
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url='https://github.com/Shatur95/optimus-manager-qt'
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras optimus-manager)
makedepends=(qt5-tools libxrandr git)
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
    cd ${pkgname%-git}

    if [ $_plasma == true ]
    then
        qmake "DEFINES += PLASMA"
    else
        qmake
    fi

    make
}

package() {
    cd ${pkgname%-git}

    make INSTALL_ROOT="$pkgdir/" install
}
