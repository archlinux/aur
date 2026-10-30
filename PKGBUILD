# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-screenlocker
pkgver=6.8.0.2
pkgrel=2
pkgdesc='Library and components for secure lock screen architecture'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-screenlocker'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libx11'
	'libxcb'
	'libxi'
	'pam'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-keyboard'
	'sonic-screen-library'
	'xcb-util-keysyms'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
((USE_SYSTEMD)) || optdepends=(
	'elogind: login1 session and sleep inhibition integration'
)
provides=('kscreenlocker')
conflicts=('kscreenlocker')
groups=('sonicde')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'kde.pam'
	'kde-fingerprint.pam'
	'kde-smartcard.pam'
)
sha256sums=('32b190a21a5ca2e7d8d2c90068de9a69839d46ac557d78a5067dfd471a1f67a9'
            'adba7bb7c27eb3a572e5e9d3cea0dbeebe59d3634472d1863d14fe892cb13b2b'
            '32734b4e1ec8b7f7e32b6cb2d68285c5c4f15f53736bba085096e76095181241'
            '5d9c31cbf66e8e455b9559c929f184efd598f714743d5a1e6ce20adb44dc4b2d')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -Dm644 "$srcdir"/kde.pam "$pkgdir"/usr/lib/pam.d/kde
	install -Dm644 "$srcdir"/kde-fingerprint.pam "$pkgdir"/usr/lib/pam.d/kde-fingerprint
	install -Dm644 "$srcdir"/kde-smartcard.pam "$pkgdir"/usr/lib/pam.d/kde-smartcard
}
