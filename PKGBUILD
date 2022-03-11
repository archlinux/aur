# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.22.3.1
_pkgtag="${pkgver:2}"
_pkgtag="Beta_${_pkgtag//./_}"
pkgrel=1
epoch=1
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-base' 'qt6-multimedia' 'qt6-wayland')
makedepends=('samurai' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz"
        "Commander Wars.desktop")
sha512sums=('d025313ba93751c0c641f84ae00bfe7c389b2d61aab97f39c75b9c09977df8830a14f8110b276c92dca789eba5e0050f939aa41de918f90d7954fc1f309c5602'
            '7d670b514cc373423420879433eb72e18eed75ae9b5288b24e47fa3c8d5acd3ca33d86cd53a0992d8a11a6550cfc711a3d6ad37a3ada889bea3d19497e8d9fe7')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
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
		-DBUILD_TESTING=off

	samu
}

package()
{
	cd "$srcdir/Commander_Wars-$_pkgtag/build"

	DESTDIR="mess" samu install #game does not use the Linux directory structure; Files must move manual to the right place.
	
	cd mess/usr/Commander_Wars*
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -p   "Commander_Wars" "$pkgdir/usr/bin/$pkgname"
	cp -prT "templates/"     "$pkgdir/usr/share/$pkgname/"
	
	install -Dm 644 "$srcdir/Commander_Wars-$_pkgtag/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm 755 "$srcdir/Commander Wars.desktop" "$pkgdir/usr/share/applications/Commander Wars.desktop"
}
