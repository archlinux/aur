# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.3.90
pkgrel=1
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus' 'libevent' 'curl' 'json-c')
optdepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('098aa70697af67d138b3abf663e5f7cff7d4b3665e666da36f90e02d5a876602')
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	meson -Dbuildtype=release --strip -Db_pie=true -Db_ndebug=if-release -Db_lto=true -Db_asneeded=true -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}
