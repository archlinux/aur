# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

# Submodule versions
_singleapplication=3.1.3

pkgname=optimus-manager-qt
pkgver=1.5.1
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url=https://github.com/Shatur95/optimus-manager-qt
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras 'optimus-manager>=1.3')
makedepends=(qt5-tools extra-cmake-modules libxrandr)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        SingleApplication-$_singleapplication.tar.gz::https://github.com/itay-grudev/SingleApplication/archive/v$_singleapplication.tar.gz)
sha256sums=(3067d6dad33bdaf838eec01b1f5c02f9a2b4897e0e7304ca2a0a1bed6f7e7bd8
            4585f02fbfba61626e4ed4f1815b847c72f1593bffac6015f6e75f514094f148)

if [ $_plasma == true ]
then
    depends+=(knotifications kiconthemes)
fi

# Move submodules into the project
prepare() {
    mv SingleApplication-$_singleapplication/* $pkgname-$pkgver/src/third-party/singleapplication
}

build() {
    mkdir -p $pkgname-$pkgver/build
    cd $pkgname-$pkgver/build

    if [ $_plasma == true ]
    then
        cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D PLASMA=ON ..
    else
        cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
    fi

    cmake --build .
}

package() {
    cd $pkgname-$pkgver/build
    cmake --install .
}
