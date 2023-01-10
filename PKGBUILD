# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.28.2
_pkgtag="Beta28_Build2"
pkgrel=1
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-declarative' 'qt6-multimedia')
makedepends=('ninja' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz"
        '0001-fix-QStandardPaths-include.patch')
sha512sums=('56eba5f3de984a4912f0984f067a8daf9107b48c74162918c42024fd14c871da91d529663d7d6c65d197173750368b72ad1b2c1b77bd47c76dcf2cd2a6db1fe6'
            '2de911786944e44a18f524508827805992a02a6890638a0e24bfcbac02374df90e8334376973263492ea04454b9ac368e71d3aa91d4b7b33a0bbc5af661bfcc2')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	patch -N -p1 -i "$srcdir/0001-fix-QStandardPaths-include.patch"
	sed -i "0,/project (Commander_Wars/s/project (Commander_Wars /project ($pkgname /g" CMakeLists.txt #keep using old save files
	sed -i "s/commander_wars/$pkgname/g" Commander_Wars.desktop
	sed -i '/RPATH/d' CMakeLists.txt #remove insecure RPATH '/../'
	mkdir -p build
}

build()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSEAPPCONFIGPATH=ON \
		-DOPENSSL_USE_STATIC_LIBS=OFF

	ninja
}

package()
{
	cd "$srcdir/Commander_Wars-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	echo "remove qt libs"
	rm -rf "$pkgdir/usr/lib" #qt libarys are not needed, if the qt package is installed; addr2line binary is not used on linux
}
