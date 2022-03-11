# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=commander-wars
pkgver=0.21.4
_pkgtag="${pkgver:2}"
_pkgtag="Beta_${_pkgtag//./_}_Hotfix"
pkgrel=1
epoch=1
pkgdesc="Advance Wars Clone with a lot of additions customizations and modding support"
arch=("$CARCH")
url="https://github.com/Robosturm/Commander_Wars"
license=('LGPL3')
options=(!emptydirs)
depends=('qt6-base' 'qt6-multimedia' 'qt6-wayland')
makedepends=('samurai' 'qt6-tools')
source=("https://github.com/Robosturm/Commander_Wars/archive/$_pkgtag.tar.gz")
sha512sums=('79704cfd187e7cd5051ce08751ce99f3169b80264d9bbbd2b15e2d6401e11e4ba198c9728cd448c6a286fa8a1b9c180ebc6e7f95ba8120411fcd1e67aeedecbe')

prepare()
{
	cd "$srcdir/Commander_Wars-$_pkgtag"
	mkdir -p build
	cp -rT "coreengine/android/" "coreengine/linux/" #crash reporter is not compatible with glibc 2.34 or newer; use empty android crash reporter; see https://github.com/Robosturm/Commander_Wars/issues/832
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
	
	cd "mess/usr/Commander_Wars_Release"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/commander-wars/"
	mkdir -p "$pkgdir/usr/share/commander_wars"
	cp -p   "Commander_Wars" "$pkgdir/usr/bin/commander-wars"
	cp -p   "addr2line"      "$pkgdir/usr/lib/commander-wars/addr2line"
	cp -prT "platforms/"     "$pkgdir/usr/lib/commander-wars/"
	cp -prT "templates/"     "$pkgdir/usr/share/commander-wars/"
}
