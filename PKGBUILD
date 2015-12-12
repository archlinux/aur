# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=antimony
pkgver=0.9.0
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
url="http://www.mattkeeter.com/projects/antimony/3/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'boost-libs' 'python' 'libpng' 'lemon')
makedepends=('boost')
source=("https://github.com/mkeeter/antimony/archive/$pkgver.tar.gz")
md5sums=('a5390c486cd0ec2bf7a1578d7eec8ec9')

# todo, replace bundled eigen with official

build() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i 's|\(executable.path =\).*|\1 /usr/bin|' app/app.pro
    sed -i 's|\(nodes_folder.path =\).*|\1  /usr/share/antimony/sb/nodes|' app/app.pro
    sed -i 's|\(fab_folder.path =\).*|\1 /usr/lib/python3.5/site-packages/fab|' app/app.pro
    sed -i 's|return path.join("/");|return "/usr/share/antimony/sb/nodes";|' app/src/app/app.cpp
    sed -i 's|lpython3.4m|lpython3.5m|' qt/python.pri

    # probably a flag somewhere to make this syntax kosher
    sed -i 's|{-1,-1,-1}|std::make_tuple(-1,-1,-1)|' lib/fab/inc/fab/types/shape.h
    sed -i 's|{r,g,b}|std::make_tuple(r,g,b)|' lib/fab/src/types/shape.cpp

    mkdir -p build
    cd build
    qmake-qt5 PREFIX="/usr" ../sb.pro
    sed -i 's|/local/bin|/bin|g' Makefile
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p tests
    cd tests
    qmake-qt5 PREFIX="/usr" ../lib/fab/fab-tests.pro
    qmake-qt5 PREFIX="/usr" ../lib/graph/graph-tests.pro
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make INSTALL_ROOT="$pkgdir" install
    make INSTALL_ROOT="$pkgdir" install
    install -Dm755 app/antimony "$pkgdir/usr/bin/antimony"
}
