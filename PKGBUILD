
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-git
_pkgname=${pkgname%-*}
pkgver=1.7.1.r21.ga8e1e8d
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-bin')
depends=('libretls')
source=("git+https://git.omarpolo.com/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	MANDIR='usr/share/man/' ./configure PREFIX='usr/'
	make
}

check() {
	cd "$srcdir/$_pkgname"
	make regress
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 contrib/gmid.service -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
