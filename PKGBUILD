# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.22.5.2
_pkgtag="22_5_v2"
_pkgtag="Beta_${_pkgtag//./_}"
pkgrel=2
epoch=0
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-base' 'qt6-multimedia' 'qt6-wayland')
makedepends=('samurai' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz"
        "Commander Wars.desktop")
sha512sums=('875809aa3c14bc84f642a9315023e373f5638f7d5ba1ba601051cda3c37c1c016d04603ae5ea803dbabcbfd804938bcbb3871668feb61e92a572de28471080d8'
            '7d670b514cc373423420879433eb72e18eed75ae9b5288b24e47fa3c8d5acd3ca33d86cd53a0992d8a11a6550cfc711a3d6ad37a3ada889bea3d19497e8d9fe7')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	sed -i "0,/project (Commander_Wars/s/project (Commander_Wars /project ($pkgname /g" CMakeLists.txt #keep using old save files
	sed -i "s/commander_wars/$pkgname/g" Commander_Wars.desktop
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
	rm -rf "$pkgdir/usr/lib" #do not need qt libarys, if the qt packeg is installed; addr2line is not used on linux
}
