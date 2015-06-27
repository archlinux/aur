# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.6
pkgrel=1
arch=('any')
url="https://launchpad.net/backintime"
license=('GPL')
makedepends=('python')
_stupidnumber=210130362
source=("https://launchpadlibrarian.net/$_stupidnumber/$_pkgname-$pkgver.tar.gz"
"https://launchpadlibrarian.net/$((_stupidnumber + 1))/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('2f86187d3ec237e97ad9d1d620cffab2cf7dea0410d663d8ae359504cd0edc13'
            'SKIP')
validpgpkeys=('3E70692EE3DB8BDDA5991C90615F366D944B4826') # Germar Reitze
# https://wiki.archlinux.org/index.php/Makepkg#Signature_checking

build() {
	cd "$_pkgname-$pkgver/common"
	./configure --python --no-fuse-group
	make

	cd "$srcdir/$_pkgname-$pkgver/qt4"
	./configure --python
	make
}

package_backintime-cli() {
	pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
	depends=('rsync' 'cron' 'openssh' 'python-keyring' 'python-dbus' 'polkit')
	optdepends=('backintime: QT4 GUI version'
	'encfs: encrypted filesystem in user-space'
	'pm-utils: for laptops allows an option to not snapshot on battery'
	'sshfs: FUSE client based on the ssh file transfer protocol')
	conflicts=('backintime<1.1.0')
	replaces=('backintime<1.1.0')

	cd "$_pkgname-$pkgver/common"
	make DESTDIR="$pkgdir" install
}

package_backintime() {
	pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. QT4 GUI version."
	depends=("backintime-cli=$pkgver" 'xorg-xdpyinfo' 'python-pyqt4' 'libnotify'
	'ttf-font' 'icu' 'polkit')
	
	# note users can optionally install EITHER kdesdk-kompare OR meld but not both!
	optdepends=('kdesdk-kompare: diff/patch frontend'
	'meld: diff/patch frontend'
	'python-keyring: store and access passwords safely')
	conflicts=("backintime<1.1.0")
	replaces=("backintime<1.1.0")

	cd "$_pkgname-$pkgver/qt4"
	make DESTDIR="$pkgdir" install
}
