# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Evangelos Paterakis <evan@geopjr.dev>

pkgname=collision-git
_app_id=dev.geopjr.Collision
pkgver=3.2.0.r0.gafbf142
pkgrel=1
pkgdesc="Check hashes for your files. A simple GUI tool to generate, compare and verify MD5, SHA1 & SHA256 hashes"
arch=('x86_64')
url="https://github.com/GeopJr/Collision"
license=('BSD2')
depends=('libadwaita' 'libyaml')
makedepends=('git' 'crystal' 'gobject-introspection' 'shards' 'spglib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
  0288-Use-pacman-hooks.patch)
_source=Collision
b2sums=('SKIP'
        '77c51994e7d5035eda087d0e1ec03a54cd32c559438a08112af1a4f318f4fbf8a86e4c21af42e26d6b1d5a96525f4d0f55a15db1b492b84d4bb53ee7da013e9c')

pkgver() {
  cd "$_source"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_source"
  patch -p1 -i ../0288-Use-pacman-hooks.patch
}

build() {
  cd "$_source"
  make all
  make gresource
  make metainfo
}

check() {
  cd "$_source"
  make test
}

package() {
	cd "$_source"
	make PREFIX="$pkgdir/usr" install
	
	install -Dm644 "data/$_app_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_app_id.metainfo.xml"
  install -Dm644 "data/$_app_id.gresource.xml" "$pkgdir/usr/share/$_app_id/$_app_id.gresource.xml"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  
}
