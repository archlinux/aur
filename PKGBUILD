# Maintainer: Baudouin Feildel <baudouin_aur@feildel.fr>
pkgname=pgsql-ogr-fdw
pkgver=1.1.4
pkgrel=1
pkgdesc="PostgreSQL foreign data wrapper for OGR"
arch=('i686' 'x86_64')
url="https://github.com/pramsey/pgsql-ogr-fdw"
license=('MIT')
depends=('gdal')
#optdepends=()
makedepends=('postgresql' 'llvm')
source=(
	"https://github.com/pramsey/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-bin-install-path.patch"
	"$pkgname-$pkgver-use-cflags-from-env.patch")
sha256sums=(
	'7bacb28ace465773544d76d8ad7b7bfb95245c6ad68aa2c58f785b54da93234a'
	'bbde8139a04293d0c51ed13a4baedddfe206a19f34b27084776032d715847822'
	'bf052972161e4b5317d747dca15bccd7538daf6441722ee74b2fb068a72fd0e3')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-fix-bin-install-path.patch"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-use-cflags-from-env.patch"
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
