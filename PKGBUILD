# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=antimony
pkgver=0.9.2
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
url="http://www.mattkeeter.com/projects/antimony/3/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'boost-libs' 'python' 'libpng' 'lemon')
makedepends=('boost' 'ninja')
source=("$pkgname.$pkgver.tgz::https://github.com/mkeeter/antimony/archive/$pkgver.tar.gz")
md5sums=('bef515c3501367c97637756d9ac25720')

# todo, replace bundled eigen with official

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i 's|/usr/local/|/usr/|' app/app/{app,main}.cpp app/CMakeLists.txt

    #sed -i 's|\(executable.path =\).*|\1 /usr/bin|' app/app.pro
    #sed -i 's|\(nodes_folder.path =\).*|\1  /usr/share/antimony/sb/nodes|' app/app.pro
    #sed -i 's|\(fab_folder.path =\).*|\1 /usr/lib/python3.6/site-packages/fab|' app/app.pro
    #sed -i 's|return path.join("/");|return "/usr/share/antimony/sb/nodes";|' app/src/app/app.cpp
    #sed -i 's|lpython3.4m|lpython3.6m|' qt/python.pri

    # probably a flag somewhere to make this syntax kosher
    #sed -i 's|{-1,-1,-1}|std::make_tuple(-1,-1,-1)|' lib/fab/inc/fab/types/shape.h
    #sed -i 's|{r,g,b}|std::make_tuple(r,g,b)|' lib/fab/src/types/shape.cpp
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ../ -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    ninja
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"
    lib/fab/SbFabTest
    lib/graph/SbGraphTest
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" ninja install
    install -Dm644 ../README.md "$pkgdir/usr/share/licenses/$pkgname/README"
}

