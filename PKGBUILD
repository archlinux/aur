# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.20
pkgrel=1
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
#source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('51b020773864781d707283c2b0dbc6ba68cdecb9b9a52ce9296843c36dd21c2c')

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
	depends=('rsync' 'cron' 'openssh' 'python-keyring' 'python-dbus' 'polkit')
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
