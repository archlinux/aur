# Maintainer: chr0mag <phillips.julian AT gmail DOT com>
pkgname=sos
pkgver=3.5
pkgrel=3
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
makedepends=('python-sphinx' 'python-nose' 'python-coverage')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/sos.conf')
options=()
install=
changelog=
_urlparsefix="0b30e8f72c3c669455209d15b1eb01de20c7d578.patch"
source=("https://github.com/sosreport/sos/archive/$pkgver.tar.gz" "https://github.com/sosreport/sos/commit/$_urlparsefix" "arch.py")
noextract=()
md5sums=()
sha256sums=('f62df231dd3c86a54645989f943bac6f5fdf45ffb210f4b76b4a5cc565296902'
            'acf581080bad7772f10e183d18a2d1c2cf9bd9be91ee490e38ef5c5647859d6c'
            '8a6565c1f7cd59ee9de3fc3896cafbf270a8e135e752901e8527471a7a405774')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	# fix for: https://github.com/sosreport/sos/commit/0b30e8f72c3c669455209d15b1eb01de20c7d578
	patch sos/plugins/haproxy.py < ../../$_urlparsefix
	#add basic Arch policy
	cp ../../arch.py sos/policies
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
	#workaround for: https://github.com/sosreport/sos/issues/77
	#sed --in-place 's/#disable = rpm, selinux, dovecot/disable = rpm, selinux, dovecot, sunrpc, nfsserver, distupgrade/' ${pkgdir}/etc/sos.conf
}
