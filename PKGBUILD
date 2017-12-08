# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=2.3.7
_buildnr=7543
pkgrel=1
pkgdesc="lightweight authoritative Name Server with DNSSEC capabilities"
arch=('x86_64')
url="http://www.yadifa.eu"
license=('FreeBSD')
depends=('openssl')
backup=('etc/yadifad.conf')
options=(!libtool)
source=(
	"http://cdn.yadifa.eu/sites/default/files/releases/$pkgname-$pkgver-$_buildnr.tar.gz"
	'yadifa.service'
)
sha256sums=('cef11b3564777eef49f7c1129b9b7469a1bec117c384baf05a235a71e0919f48'
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

