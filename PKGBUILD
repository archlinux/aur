# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Quentin Chateau <quentin.chateau@gmail.com>
# Contributor: Quentin Chateau <quentin.chateau@gmail.com>
pkgname=autopanorama
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Make panorama from multiple pictures"
arch=('any')
url="https://github.com/Tytan/AutoPanorama"
license=('GPL')
groups=()
depends=('qt5-base' 'jasper' 'libwebp')
makedepends=('qt5-base' 'cmake')
checkdepends=()
optdepends=()
provides=("$pkgname")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/Tytan/AutoPanorama.git#tag=$pkgver.$pkgrel")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    git submodule init
    git submodule update --depth=1
    ./scripts/compile_opencv.sh
}

build() {
    CORES=`nproc --all`
	cd "$pkgname-$pkgver"
    mkdir -p build/$pkgname
    cd build/$pkgname
    qmake ../../AutoPanorama.pro
	make -j$CORES
}

package() {
	cd "$pkgname-$pkgver/build/$pkgname"
    make INSTALL_ROOT=$pkgdir install
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/share/applications/
    cp res/autopanorama.ico $pkgdir/usr/share/$pkgname/
    cp linux/autopanorama.desktop $pkgdir/usr/share/applications/
}
