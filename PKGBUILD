# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=2.2.0
_buildnr=6259
pkgrel=1
pkgdesc="lightweight authoritative Name Server with DNSSEC capabilities"
arch=('i686' 'x86_64')
url="http://www.yadifa.eu"
license=('FreeBSD')
depends=('openssl')
backup=('etc/yadifad.conf')
options=(!libtool)
source=(
	"http://cdn.yadifa.eu/sites/default/files/releases/$pkgname-$pkgver-$_buildnr.tar.gz"
	'yadifa.service'
)
sha256sums=('1fbb5c142bca851242d223f6e2a5614343f5388253c47d29aa4cc02c7a34b90b'
            '438fff4a6c81cb5d2bd35d276abdae6cf5de04c997b7b7d893fdbf3372034130')

build() {
	cd $pkgname-$pkgver-$_buildnr
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-dynamic-provisioning \
		--enable-rrl
	make
}

package(){
	cd $pkgname-$pkgver-$_buildnr
	make DESTDIR="$pkgdir" install

	# systemd service file
	install -Dm644 "$srcdir/yadifa.service" "$pkgdir/usr/lib/systemd/system/yadifa.service"

	# little cleanup
	rm -rf "$pkgdir/var/run"
	rm -rf "$pkgdir/var/log"
}

