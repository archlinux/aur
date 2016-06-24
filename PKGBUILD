# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.12
pkgrel=4
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz"
'pkexec1.1.12.patch'
'keyring1.1.12.patch')
sha256sums=('76036de6abdf5a2b2fbf66311c369dce7e3755fa778e5f01aa49bc2be68eb9f1'
            'b5be2317976db5d946047b5daa7ef75b029498225a9bb2763a18c93b07686e5e'
            '9ae26aa553b7917771b97c3f0b16459ea0f79130a7505b09f1feba93d96c1025')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -Np1 -i "$srcdir/keyring1.1.12.patch"
	patch -Np1 -i "$srcdir/pkexec1.1.12.patch"
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
