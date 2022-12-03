# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgbase=collision
pkgname=(collision collision-nautilus-extension)
_app_id=dev.geopjr.Collision
pkgver=3.3.1
pkgrel=2
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64' 'aarch64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('crystal' 'gobject-introspection' 'shards' 'spglib')
optdepends=('libnautilus-extension: Extension interface for Nautilus'
	'collision-nautilus-extension: GNOME Files extension that adds a (Check Hashes) context menu item')
conflicts=("$pkgname-hashes" "hashbrown")
replaces=("$pkgname-hashes" "hashbrown")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	0288-Use-pacman-hooks.patch)
_source=Collision
b2sums=('8936413820554eaaa04aa1124f31a088b088b56c9daefd70bd8f7d0748e4a915322467842395526e59a65938ecedb4dde26ad616fcf9a412350abef03cfd646d'
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
  make test || :
}

package_collision() {
	cd "$_source-$pkgver"
	make PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
	install -Dm644 "data/$_app_id.gresource.xml" "$pkgdir/usr/share/$_app_id/$_app_id.gresource.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_collision-nautilus-extension() {
	pkgdesc="GNOME Files extension that adds a (Check Hashes) context menu item"

	cd "$_source-$pkgver"
	
	mkdir -p "$pkgdir/usr/share/nautilus-python/extensions/"
	install -Dm644 nautilus-extension/collision-extension.py "$pkgdir/share/nautilus-python/extensions/"
}
