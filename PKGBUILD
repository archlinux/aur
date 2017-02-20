pkgname=cen64-qt-git
pkgver=20170121
pkgrel=1
pkgdesc="A basic frontend for CEN64"
arch=('i686' 'x86_64')
url="https://github.com/dh4/cen64-qt"
license=('BSD')
depends=('quazip' 'cen64-git' 'hicolor-icon-theme')
install=cen64-qt-git.install
source=("git://www.github.com/dh4/cen64-qt")
sha256sums=('SKIP')

pkgver() {
    cd cen64-qt
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    mkdir -p build

    sed -i 's#include <quazip/#include <quazip5/#g' cen64-qt/src/common.cpp cen64-qt/src/emulation/emulatorhandler.cpp
}

build() {
    cd cen64-qt
    ./build-scripts/revision.sh

    cd ../build
    qmake-qt5 ../cen64-qt
    make
}

package() {
    cd build
    install -Dm755 "cen64-qt"                                   "$pkgdir/usr/bin/cen64-qt"
    install -Dm644 "../cen64-qt/LICENSE"                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "../cen64-qt/resources/cen64-qt.desktop" "$pkgdir/usr/share/applications/cen64-qt.desktop"
    install -Dm644 "../cen64-qt/resources/images/cen64.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cen64-qt.png"
}
