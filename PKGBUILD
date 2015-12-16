# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=('backintime' 'backintime-cli')
_pkgname="backintime"
pkgver=1.1.8
pkgrel=4
arch=('any')
url="https://github.com/bit-team/backintime"
license=('GPL')
makedepends=('python')
source=("https://github.com/bit-team/$_pkgname/archive/v$pkgver.tar.gz"
"Fix_bug_473-AttributeError.patch")
sha256sums=('d5475eddcbe9612eb8814cb811bee394ad140a560d28c4d20258f3a6078648ff'
            '281b75fa6726e621b8ecabe8310b7e9e126848eb2215082df38fdf2cbdc52786')

prepare() {
	cd "$_pkgname-$pkgver/common"
	patch -i "$srcdir/Fix_bug_473-AttributeError.patch"
}

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
	
	# note users can optionally install EITHER kompare OR meld but not both!
	optdepends=('kompare: diff/patch frontend'
	'meld: diff/patch frontend'
	'python-keyring: store and access passwords safely')
	conflicts=("backintime<1.1.0")
	replaces=("backintime<1.1.0")

	cd "$_pkgname-$pkgver/qt4"
	make DESTDIR="$pkgdir" install
}
