# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.25.1
_pkgtag="Beta_25_1"
pkgrel=1
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-declarative' 'qt6-multimedia')
makedepends=('ninja' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz")
sha512sums=('297a2bfc6081fd2513df26b3855f1fa7afe2c8bc89742d144842711b73d769dc4b3ca52616fbc3dcf20c7b133429e715715fdeddcf4a50dcfd4c816b7633385c')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
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
