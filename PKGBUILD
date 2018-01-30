# Maintainer: chr0mag <phillips.julian AT gmail DOT com>
pkgname=sos
pkgver=3.5
pkgrel=4
epoch=
pkgdesc="A unified tool for collecting system logs and other debug information"
arch=('any')
url="https://github.com/sosreport/sos"
license=('GPL2')
groups=()
depends=('python'
	 'python-six'
	 'python-lxml'
	 'xz'
	 'tar')
makedepends=('python-sphinx') 
checkdepends=('python-nose' 'python-coverage')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/sos.conf')
options=()
install=
changelog=
_urlparsefix="0b30e8f72c3c669455209d15b1eb01de20c7d578.patch"
_archpullreq="1198.patch"
source=("https://github.com/sosreport/sos/archive/$pkgver.tar.gz"
	"https://github.com/sosreport/sos/commit/$_urlparsefix"
	"https://patch-diff.githubusercontent.com/raw/sosreport/sos/pull/$_archpullreq")
noextract=()
md5sums=()
sha256sums=('f62df231dd3c86a54645989f943bac6f5fdf45ffb210f4b76b4a5cc565296902'
            'acf581080bad7772f10e183d18a2d1c2cf9bd9be91ee490e38ef5c5647859d6c'
            'a57c89078c6ccbb99a2b5e5ff939979f8283ec4f68aa258d743634106607b950')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	# fix for: https://github.com/sosreport/sos/commit/0b30e8f72c3c669455209d15b1eb01de20c7d578
	patch --strip=1 < ../../$_urlparsefix
	#add basic Arch support
	patch --strip=1 < ../../$_archpullreq
}

build() {
	cd "$pkgname-$pkgver"
	make build
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	#put binary in /usr/bin instead of /usr/sbin
	mkdir ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/sosreport ${pkgdir}/usr/bin
	rmdir ${pkgdir}/usr/sbin
}
