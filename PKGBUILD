# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.2.0
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'shards' 'spglib')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("${url}/archive/v${pkgver}.tar.gz"
	0288-Use-pacman-hooks.patch)
_source=Collision
b2sums=('63a33bf22c009810e9bcea17e9bb890213c06d6c784a917d57dc66f7e4d0f1f0b5badd03f584fe2679fa13fa11a5c41ef5fe780922de40bfb7859aba6d896bad'
        '77c51994e7d5035eda087d0e1ec03a54cd32c559438a08112af1a4f318f4fbf8a86e4c21af42e26d6b1d5a96525f4d0f55a15db1b492b84d4bb53ee7da013e9c')

prepare() {
  cd "$_source-$pkgver"
  patch -p1 -i ../0288-Use-pacman-hooks.patch
}

build() {
  cd "$_source-$pkgver"
  make all
  make gresource
  make metainfo
}

check() {
  cd "$_source-$pkgver"
  make test
}

package() {
	cd "$_source-$pkgver"
	make PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
	install -Dm644 "data/$_app_id.gresource.xml" "$pkgdir/usr/share/$_app_id/$_app_id.gresource.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
