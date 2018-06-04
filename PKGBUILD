# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=nitrokey-app
pkgver=1.3
pkgrel=4
_cppcodecver=61d9b044d6644293f99fb87dfadc15dcab951bd9
pkgdesc="Nitrokey management application"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'hicolor-icon-theme' 'libnitrokey=3.3')
makedepends=('cmake' 'qt5-tools')
install=nitrokey-app.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nitrokey/nitrokey-app/archive/v$pkgver.tar.gz"
        "cppcodec.tar.gz::https://github.com/tplgy/cppcodec/archive/${_cppcodecver}.tar.gz")
sha256sums=('a73dc2ce70f3f84a9fcf4e8cfd5b97630f5195c0897392b301a2a48adfd64300'
            '80c2f0ebc0da7186386f525d798bad0eaf14837c9548d86060b503751193b010')

prepare() {
    cd $pkgname-$pkgver

    sed -i '/qt5_add_resources(RESOURCE_ADDED/d' CMakeLists.txt

    sed -i 's|libnitrokey/LICENSE|/usr/share/licenses/libnitrokey/LICENSE|' \
        resources.qrc

    # Patch for Qt5.11. See https://github.com/Nitrokey/nitrokey-app/issues/361#issuecomment-394345354
    sed -i '/#include "stick20changepassworddialog.h"/ i #include <QStyle>' \
        src/ui/stick20changepassworddialog.cpp
    sed -i '/#include <QDateTime>/ i #include <QStyle>' \
        src/ui/stick20responsedialog.cpp

    cd 3rdparty
    rmdir cppcodec
    ln -s $srcdir/cppcodec-${_cppcodecver} cppcodec

    cd ../data/icons
    rm -r ubuntu-mono-dark ubuntu-mono-light
}

build() {
    cd $pkgname-$pkgver

    cmake . \
          -DCMAKE_BUILD_TYPE=Release \
          -DBUILD_SHARED_LIBS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd $pkgname-$pkgver

    make DESTDIR="$pkgdir" install
}
