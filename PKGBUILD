# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

pkgname=dqlite
pkgver=1.4.3
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('LGPL3')
depends=('libuv' 'raft' 'libco' 'sqlite-replication')
makedepends=('tcl' 'readline' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('60627f3b51594c953e2420f0de52d02a73768968ddd5650f3b95e5a045909d19')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i 
	PKG_CONFIG_PATH="/usr/lib/sqlite-replication/pkgconfig" ./configure --prefix=/usr
	make LDFLAGS="-Wl,-R/usr/lib/sqlite-replication"
}

check() {
	cd "$pkgname-$pkgver"
	make LDFLAGS="-Wl,-R/usr/lib/sqlite-replication" check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
