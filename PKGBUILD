# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

pkgname=dqlite
pkgver=1.4.2
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('LGPL3')
depends=('libuv' 'raft' 'libco' 'sqlite-replication')
makedepends=('tcl' 'readline' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('acc7b9937cca16394725bdb48379f2364d7a3c640d1a5c27600f191e7cc9cf56')

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
