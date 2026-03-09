# Maintainer: Petr Spacek <pspacek@isc.org>
pkgname=dnscap-git
pkgver=v2.5.2.r1.9a3b3e3d94
pkgrel=1
pkgdesc="Network capture utility designed specifically for DNS traffic"
arch=(x86_64)
url="https://www.dns-oarc.net/tools/dnscap"
license=('ISC')
depends=(glibc ldns libpcap lz4 openssl perl-yaml xz zlib zstd)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://codeberg.org/DNS-OARC/dnscap.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --recursive --init
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
