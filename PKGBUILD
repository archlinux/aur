# Maintainer: Daniel Escoz <darkhogg+aur@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=knyttstories
pkgver=1.2.1
pkgrel=7
pkgdesc="In Knytt Stories, each level is its own little adventure. One level is included with the game, where you have to stop a machine that draws the life out of the planet. An official expansion pack is also featured at the website with four original levels."
# url="http://nifflas.ni2.se/" # it's down as of 2025-04-27
url="http://egomassive.com/ks/" # not the actual original site but the closest right now...
arch=('i686' 'x86_64')
depends=(wine)
makedepends=('unzip')
source=(knyttstories
        msvcp60.zip
        "http://egomassive.com/ks+/KS121.zip"
        knyttstories.desktop
        knyttstories.png)
license=('freeware')
install=knyttstories.install
md5sums=('b34bc8c1f391c9a5efb9e984606a6c16'
         'e27d1c3b981aff789500e0ba2cd05616'
         '6d5c344fcd9b7c20df003abf03e44777'
         'f41b9e383744e08ac5de5fe7330a3735'
         'd997338aae63d77ce4bedcd218dcb5d2')

package() {
	# Initial directories for game files
	install -d -m755 $pkgdir/usr/share/knyttstories
	mv $srcdir/"Knytt Stories"/* $pkgdir/usr/share/knyttstories/
	install -d -m775 -o root -g games $pkgdir/var/games/knyttstories
	mv $pkgdir/usr/share/knyttstories/Worlds $pkgdir/var/games/knyttstories/

	# We need this DLL for the override else knyttstories won't work
	mv $srcdir/msvcp60.dll $pkgdir/usr/share/knyttstories/msvcp60.dll

	# Now lets manually change all the permissions since its a Windows game
	find $pkgdir/usr/share/knyttstories -type d -exec chmod 755 "{}" \;
	find $pkgdir/usr/share/knyttstories -type f -exec chmod 644 "{}" \;
	find $pkgdir/var/games/knyttstories -type d -exec chmod 775 "{}" \;
	find $pkgdir/var/games/knyttstories -type f -exec chmod 644 "{}" \;
	find $pkgdir/var/games/knyttstories -type d -exec chown root:games "{}" \;
	find $pkgdir/var/games/knyttstories -type f -exec chown root:games "{}" \;

	# Install scripts for the user to run
	install -d -m755 $pkgdir/usr/bin
	install -m755 knyttstories $pkgdir/usr/bin

	# Install icon
	install -Dm644 ${srcdir}/knyttstories.desktop ${pkgdir}/usr/share/applications/knyttstories.desktop
	install -Dm644 ${srcdir}/knyttstories.png ${pkgdir}/usr/share/pixmaps/knyttstories.png
}
