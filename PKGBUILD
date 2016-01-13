# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.12
pkgrel=1
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('76036de6abdf5a2b2fbf66311c369dce7e3755fa778e5f01aa49bc2be68eb9f1')

#prepare() {
#	cd "$_pkgname-$pkgver/common"
#	patch -i "$srcdir/Fix_bug_473-AttributeError.patch"
#}

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
	conflicts=('backintime<1.1.0')
	replaces=('backintime<1.1.0')

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
	conflicts=("backintime<1.1.0")
	replaces=("backintime<1.1.0")

	cd "$_pkgname-$pkgver/qt4"
	make DESTDIR="$pkgdir" install
}
