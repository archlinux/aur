# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=antimony
pkgver=0.8.0
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
url="http://www.mattkeeter.com/projects/antimony/3/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'boost-libs' 'python' 'libpng')
makedepends=('boost')
source=("https://github.com/mkeeter/antimony/archive/$pkgver.tar.gz")
md5sums=('cf3873907a46cc6230de78c66e12c66d')

# todo, replace bundled eigen with official

build() {
    cd "$srcdir/$pkgname-$pkgver"

    #sed -i 's/lboost_python-py34/lboost_python3/' qt/shared.pri
    sed -i 's|/usr/local/bin/sb/fab|/usr/lib/python3.4/site-packages/fab|' qt/antimony.pro
    sed -i 's|/usr/local/bin/sb/nodes|/usr/share/antimony/sb/nodes|' qt/antimony.pro
    sed -i 's|/usr/local/bin|/usr/bin|' qt/antimony.pro
    sed -i 's|return path.join("/");|return "/usr/share/antimony/sb/nodes";|' src/app/app.cpp

    mkdir -p build
    cd build
    qmake-qt5 PREFIX="/usr" ../qt/antimony.pro
    sed -i 's|/local/bin|/bin|g' Makefile
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    return 0
    mkdir -p tests
    cd tests
    qmake-qt5 PREFIX="/usr" ../qt/antimony-tests.pro
    make
    # failure involving QNetworkAccessManager
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm755 antimony "$pkgdir/usr/bin/antimony"
    #mkdir -p "$pkgdir/usr/lib/python3.4/site-packages/"
    #cp -r "$pkgdir/usr/share/antimony/sb/fab" "$pkgdir/usr/lib/python3.4/site-packages/"
}
