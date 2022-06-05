# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tang-git
pkgver=9.r0.d98ce92
pkgrel=1
pkgdesc='Server for binding data to network presence'
arch=('x86_64')
url='https://github.com/latchset/tang'
license=('GPL3')
depends=('http-parser' 'jose')
makedepends=('git' 'asciidoc' 'meson')
checkdepends=('systemd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'tang.sysusers.conf'
        'tang.tmpfiles.conf')
sha512sums=('SKIP'
            '08b5abb5ff5195a96c1196e7336eefeabad36a82ef8862881689e3c9cfa8aebc5679e14c4aacc3fa80793fe42ffa591e6ec0ec07bf98f6e0d783e23b2f06218a'
            '48c3026b37ce3fe180633facb99a194e1fcb0ff860f6dff33541b6216b441572c1de0620102ce25e36c06f3c769b3149cb595f5aa4e355416c680b1c6f73e957')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	meson --libexecdir=/usr/lib --buildtype=plain build
	meson compile -C build
}

check() {
	cd "${pkgname%-git}"
	meson test -C build
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" meson install -C build
	mkdir -pm700 "$pkgdir/var/db/tang"
	install -Dm644 "$srcdir/tang.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "$srcdir/tang.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
