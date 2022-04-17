# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.4.95
pkgrel=2
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus>=1.9' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus>=1.9' 'libevent' 'curl' 'json-c')
optdepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')
sha256sums=('9553c71977b79fc82e2e15141f9dfd7d59f675a83cbbdfad9c4dc675a7874e63')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	export CFLAGS='-Wno-unused-parameter -Wno-free-nonheap-object -Wno-format-truncation'
	meson -Dbuildtype=release -Db_pie=true -Db_ndebug=if-release -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}
