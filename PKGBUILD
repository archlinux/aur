# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=1.0.0
_buildnr=2075
pkgrel=1
pkgdesc="YADIFA is a lightweight authoritative Name Server with DNSSEC capabilities"
arch=('i686' 'x86_64')
url="http://www.yadifa.eu"
license=('FreeBSD3')
depends=('openssl')
backup=('opt/yadifa/etc/yadifad.conf')
options=(!libtool)
source=(
	"http://cdn.yadifa.eu/sites/default/files/releases/$pkgname-$pkgver-$_buildnr.tar.gz"
	'yadifa.rc'
	'yadifa.service'
	'yadifad.conf'
)
sha256sums=(
	'026e06607a36e40aba2636a324c0e583e5364e3f3ed95fa5d1599d6790762314'
	'0ce5dde0768cc333a141314bef726faf053dc83dd6dc5354f288605b6e349895'
	'095bc19013101c74b7f6e5d79a3ef147a10dc3c362e0c7e1454a9bede6fd00d2'
	'431f16695abd0e99973edecffecaf730d1bd17dd8ed9006790345542c2c6a231'
)

build() {
	cd $pkgname-$pkgver-$_buildnr
	./configure \
		--prefix=/opt/$pkgname \
		LIBS='-ldl'
	make
}

package(){
	cd $pkgname-$pkgver-$_buildnr
	make DESTDIR="$pkgdir" install

	# install default empty config (will not make it work)
	install -Dm644 "$srcdir/yadifad.conf" "$pkgdir/opt/yadifa/etc/yadifad.conf"

	# initscripts service file
	install -Dm755 "$srcdir/yadifa.rc" "$pkgdir/etc/rc.d/yadifa"

	# systemd service file
	install -Dm644 "$srcdir/yadifa.service" "$pkgdir/usr/lib/systemd/system/yadifa.service"
}
