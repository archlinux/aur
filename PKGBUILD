# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=2.1.0
_buildnr=5055
pkgrel=2
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
sha256sums=('b63d34f8051b4d8d0371b414707f4856f5f866460e096c5785d7d8b25a05a1b3'
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

