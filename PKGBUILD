# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision
_app_id=dev.geopjr.Collision
pkgver=3.1.0
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'gobject-introspection-runtime' 'shards' 'spglib')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("${url}/archive/v${pkgver}.tar.gz"
	0288-Use-pacman-hooks.patch)
_source=Collision
b2sums=('6619dff83e5a3705ebbfdd91bbbbc242a7007b2278c6ce13205b4d7c39a8fcd377a3d75e550954583e73cbb0a023f31f3775d79e6064708248d114cf17a85492'
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
	make --debug=j PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
	install -Dm644 "data/$_app_id.gresource.xml" "$pkgdir/usr/share/$_app_id/$_app_id.gresource.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
