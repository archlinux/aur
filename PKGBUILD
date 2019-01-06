# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.24
pkgrel=2
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
#source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('74f391217c3fc33cea75abbd758914a003c1ee3bf815f31a75e7dc4c7bf11960')

prepare() {
	cd "$_pkgname-$pkgver"

  # patches here
}

build() {
	cd "$_pkgname-$pkgver/common"
	./configure --python --no-fuse-group
	make

	cd "$srcdir/$_pkgname-$pkgver/qt4"
	./configure --python
	make
}

test() {
	cd "$_pkgname-$pkgver/common"
	make test
}

package_backintime-cli() {
	pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
	depends=('rsync' 'cron' 'openssh' 'python-keyring' 'python-dbus' 'polkit' 'python-sip-pyqt4')
	optdepends=('backintime: QT4 GUI version'
	'encfs: encrypted filesystem in user-space'
	'pm-utils: for laptops allows an option to not snapshot on battery'
	'sshfs: FUSE client based on the ssh file transfer protocol')

	cd "$_pkgname-$pkgver/common"
	make DESTDIR="$pkgdir" install
}

package_backintime() {
	pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. QT4 GUI version."
	depends=("backintime-cli=$pkgver" 'xorg-xdpyinfo' 'python-pyqt4' 'libnotify'
	'ttf-font' 'icu' 'polkit')
	
	# note users can optionally install EITHER kompare OR meld but not both!
	optdepends=('kompare: diff/patch frontend'
	'meld: diff/patch frontend'
	'python-keyring: store and access passwords safely')

	cd "$_pkgname-$pkgver/qt4"
	make DESTDIR="$pkgdir" install
}
