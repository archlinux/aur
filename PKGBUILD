# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

# Submodule versions
_singleapplication=3.0.18

pkgname=optimus-manager-qt
pkgver=1.4.0
pkgrel=1
pkgdesc="A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu"
arch=('x86_64')
url="https://github.com/Shatur95/optimus-manager-qt"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'optimus-manager>=1.2.2')
makedepends=('qt5-tools' 'libxrandr')
source=($pkgname-$pkgver.tar.gz::"https://github.com/Shatur95/optimus-manager-qt/archive/$pkgver.tar.gz"
        SingleApplication-$_singleapplication.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/$_singleapplication.tar.gz")
sha256sums=('5b36e8ccb4e4f3e7246ee2745d209b08e0cd55edf11a274adca8148aba8efc57'
            '0f0ce6466dbfdadf2a7ea75aa1d461e2e279c8c03f747117c75bd376a46c6eec')

if [ $_plasma == true ]
then
    depends+=('knotifications' 'kiconthemes')
fi

# Move submodules into the project
prepare() {
    mv SingleApplication-$_singleapplication/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
  
    if [ $_plasma == true ]
    then
        qmake "DEFINES += PLASMA"
    else
        qmake
    fi

    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
} 
