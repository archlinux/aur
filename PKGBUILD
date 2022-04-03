# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.22.5.2
_pkgtag="22_5_v2"
_pkgtag="Beta_${_pkgtag//./_}"
pkgrel=4
epoch=0
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-base' 'qt6-multimedia' 'qt6-wayland')
makedepends=('samurai' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz"
        "fix_path.patch::https://github.com/Robosturm/Commander_Wars/commit/2ddd7a7b55d235f18058955ffbf0b264fbfa22f3.patch")
sha512sums=('875809aa3c14bc84f642a9315023e373f5638f7d5ba1ba601051cda3c37c1c016d04603ae5ea803dbabcbfd804938bcbb3871668feb61e92a572de28471080d8'
            'e1fcf2fb827db0a410bf2c44a7d9e65919fe37ed6f734937cb1420bd699c637160efd8acfa6c0c5bb1fcb1e018cfe96865fff23d59e5e0f24e2d671e3d8c3499')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	sed -i "0,/project (Commander_Wars/s/project (Commander_Wars /project ($pkgname /g" CMakeLists.txt #keep using old save files
	sed -i "s/commander_wars/$pkgname/g" Commander_Wars.desktop
	sed -i '/RPATH/d' CMakeLists.txt #remove insecure RPATH '/../'
	patch -Np1 -i "$srcdir/fix_path.patch" #fix missing `/` at path
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
		-DUSEAPPCONFIGPATH=ON

	samu
}

package()
{
	cd "$srcdir/Commander_Wars-$_pkgtag/build"

	DESTDIR="$pkgdir" samu install
	echo "remove qt libs"
	rm -rf "$pkgdir/usr/lib" #qt libarys are not needed, if the qt package is installed; addr2line binary is not used on linux
}
