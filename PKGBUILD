# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.5.0
pkgrel=4
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus>=1.9' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus>=1.9' 'libevent' 'curl' 'json-c')
optdepends=('xdg-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')
sha256sums=('044290a9c07e5f6b5fbcb665ded2528e07a56e024f369857967f950a814ca775')

build() {
	cd "${pkgname}-${pkgver}"
	rm -rf build/
	export CFLAGS='-Wno-stringop-truncation -Wno-unused-parameter -Wno-free-nonheap-object -Wno-format-truncation -Wno-address'
	meson -Dbuildtype=release -Db_pie=true -Db_ndebug=if-release -Dversion="${pkgver}-${pkgrel}" --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}"
	DESTDIR="${pkgdir}" ninja -C build/ install
}
