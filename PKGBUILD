# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-system-log
pkgver=26.08.2
pkgrel=1
pkgdesc='System log viewer tool'
url='https://github.com/Sonic-DE/sonic-system-log'
arch=('x86_64')
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'audit'
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-archive'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-views'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-text-widgets'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-xml-gui'
)
((USE_SYSTEMD)) && depends+=('systemd-libs')
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('ksystemlog')
conflicts=('ksystemlog')
groups=(
	'sonicde-applications'
	'sonicde-system'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('85180d7c8dfe50d6329bf4926a203f74d9ad47a4d9d3412d4255264c52d4be0f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_DISABLE_FIND_PACKAGE_Journald:BOOL="$((!USE_SYSTEMD))" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
