# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-system-monitor-library
pkgver=6.8.0
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-system-monitor-library'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libdrm'
	'libgcc'
	'libnl'
	'libpcap'
	'libstdc++'
	'libudev.so'
	'lm_sensors'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-package'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-charts'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
)
makedepends=(
	'libcap'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('libksysguard')
conflicts=('libksysguard')
replaces=('sonic-sysguard-library')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('53064ab1fee29ce5fd0df56edab67cd77d13c2a551f350913d1d31a6b1d2cde1')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	setcap CAP_NET_RAW=+ep "$pkgdir"/usr/lib/ksysguard/ksgrd_network_helper
}
