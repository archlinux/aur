# Maintainer: Guillermo Duran < gds506 at gmail dot com >
# Previous Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
pkgname=pgsql-ogr-fdw
pkgver=1.1.7
pkgrel=1
pkgdesc="PostgreSQL foreign data wrapper for OGR"
arch=('i686' 'x86_64')
url="https://github.com/pramsey/pgsql-ogr-fdw"
license=('MIT')
depends=('gdal')
#optdepends=()
makedepends=('postgresql' 'llvm')
source=("https://github.com/pramsey/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-bin-install-path.patch"
)
sha256sums=('ba1f81c4d10b91b89cb775519b3749d584c0d4de3c01fe032de0f1ae62da3c78'
	'bbde8139a04293d0c51ed13a4baedddfe206a19f34b27084776032d715847822'
)

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-fix-bin-install-path.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="$CFLAGS -Wl,-z,relro,-z,now"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	make DESTDIR="$pkgdir/" install
}
