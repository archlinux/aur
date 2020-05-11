# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

# Submodule versions
_singleapplication=3.0.19

pkgname=optimus-manager-qt
pkgver=1.5.0
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url='https://github.com/Shatur95/optimus-manager-qt'
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras 'optimus-manager>=1.3')
makedepends=(qt5-tools libxrandr)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        SingleApplication-$_singleapplication.tar.gz::https://github.com/itay-grudev/SingleApplication/archive/v$_singleapplication.tar.gz)
sha256sums=(5e1c81b5e0291b69e16a23c4f681031aa77312885d0649d548e80874c33e9a23
            9405fd259288b2a862e91e5135bccee936f0438e1b32c13603277132309d15e0)

if [ $_plasma == true ]
then
    depends+=(knotifications kiconthemes)
fi

# Move submodules into the project
prepare() {
    mv SingleApplication-$_singleapplication/* $pkgname-$pkgver/src/third-party/singleapplication
}

build() {
    cd $pkgname-$pkgver
  
    if [ $_plasma == true ]
    then
        qmake "DEFINES += PLASMA"
    else
        qmake
    fi

    make
}

package() {
    cd $pkgname-$pkgver
    make INSTALL_ROOT="$pkgdir/" install
} 
