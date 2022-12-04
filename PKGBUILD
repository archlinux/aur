
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-git
_pkgname=${pkgname%-*}
pkgver=1.8.4.r66.g8371560
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-bin')
depends=('libretls' 'libbsd')
source=(
	'git+https://github.com/omar-polo/gmid'
	'gmid.service'
	'gmid.conf'
)
sha256sums=(
	'SKIP'
	'61450ba6fb7283b03f099e5172cf4e64bf40093ad2bd126b7915940d40922c9a'
	'4d943727a57dbf5f246963c0f90ccc54919cc2296538457e6b16f29f7580d9d6'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	MANDIR='usr/share/man/' ./configure --prefix='usr/'
	make
}

package() {
	cd "$srcdir"
	install -Dm644 gmid.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 gmid.conf -t "$pkgdir/usr/lib/sysusers.d"

	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm755 contrib/gencert -t "$pkgdir/usr/share/$_pkgname"
	install -Dm755 contrib/renew-certs -t "$pkgdir/usr/share/$_pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"

	mkdir -p "$pkgdir/usr/share/vimfiles"
	cp -R contrib/vim/* "$pkgdir/usr/share/vimfiles/"
}
