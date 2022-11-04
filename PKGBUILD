
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid
pkgver=1.8.5
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
depends=('libretls' 'libbsd')
conflicts=('gmid-git' 'gmid-bin')
source=(
	"https://github.com/omar-polo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
	"gmid.service"
	"gmid.conf"
)
sha256sums=(
	'bbdf37162add9be254dfd857f69595b5fe882a8a30647d62e7a030c2e2c87c5c'
	'61450ba6fb7283b03f099e5172cf4e64bf40093ad2bd126b7915940d40922c9a'
	'4d943727a57dbf5f246963c0f90ccc54919cc2296538457e6b16f29f7580d9d6'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	MANDIR='usr/share/man/' ./configure --prefix='usr/'
	make
}

package() {
	cd "$srcdir"
	install -Dm644 gmid.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 gmid.conf -t "$pkgdir/usr/lib/sysusers.d"

	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
