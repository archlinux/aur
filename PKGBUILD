# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.3.0
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'shards' 'spglib')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	0288-Use-pacman-hooks.patch)
_source=Collision
b2sums=('abe6bcf4ad84a28fdaa7b2ac07ad21adaa4b87225f5ce55d560441d00c8c6dabe4e9174e2ead74a4d20eb3e97f8afe1913a712b94ae2e2f54ae2a824b7c753af'
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
