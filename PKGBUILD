# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-power-management
pkgver=6.8.0.1
pkgrel=2
pkgdesc='Manages the power consumption settings of a SonicDE Shell'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-power-management'
license=('LGPL-2.0-or-later')
depends=(
	'ddcutil'
	'glibc'
	'libstdc++'
	'libudev.so'
	'qcoro'
	'qt6-base'
	'qt6-declarative'
	'sonic-activities'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-screen-library'
	'sonic-workspace'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=(
	'power-profiles-daemon: power profiles support'
	'tlp: alternative power profiles support'
	'sonic-system-info: for the Energy Information KCM'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: login1 service for session tracking and power-management inhibition'
)
provides=('powerdevil')
conflicts=('powerdevil')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c057ae52b09b9c72797b4315e490d8875f1d9df4c106bc4981d5b91065961163')

build() {
	cmake -B build  -S $pkgname-$pkgver \
		-DKDE_INSTALL_LIBEXECDIR=lib \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
