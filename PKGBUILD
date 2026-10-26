# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-dr-robotnik
pkgver=6.8.0.1
pkgrel=1
pkgdesc='The SonicDE crash handler'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-dr-robotnik'
license=('GPL-2.0-or-later')
depends=(
	'elfutils'
	'gdb'
	'glibc'
	'libgcc'
	'libstdc++'
	'python'
	'python-psutil'
	'python-pygdbmi'
	'python-sentry_sdk'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keyring'
	'sonic-frameworks-notifications'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-syntax-highlighting'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-polkit'
)
((USE_SYSTEMD)) && depends+=('systemd-libs')
makedepends=('sonic-frameworks-cmake-modules')
((USE_SYSTEMD)) || optdepends+=(
	'esettingsd: hostname1 and timedate1 metadata for Sentry on dinit, runit or s6'
	'openrc-settingsd: hostname1 and timedate1 metadata for Sentry on OpenRC'
)
provides=('drkonqi')
conflicts=('drkonqi')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e20edcfa970d81e706baf5d384db5363a62626b66ae7797c8527f41d0de7fe4d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DENABLE_SYSTEMD_COREDUMP:BOOL="$USE_SYSTEMD" \
		-DWITH_PYTHON_VENDORING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
