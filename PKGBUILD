# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-login-manager
pkgver=6.8.0.3
pkgrel=2
arch=('x86_64')
pkgdesc='Sonic Login Manager'
url='https://github.com/Sonic-DE/sonic-login-manager'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'libxau'
	'pam'
	'qt6-base'
	'qt6-declarative'
	'sh'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-package'
	'sonic-frameworks-quick-silver-style'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-keyboard'
	'sonic-screen-library'
	'sonic-workspace'
	'xorg-server'
)
((USE_SYSTEMD)) && depends+=('systemd')
((USE_SYSTEMD)) || depends+=('elogind')
makedepends=(
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
((USE_SYSTEMD)) || optdepends+=(
	'esettingsd: locale1 service for keyboard defaults on dinit, runit or s6'
	'openrc-settingsd: locale1 service for keyboard defaults on OpenRC'
)
provides=('plasma-login-manager')
conflicts=('plasma-login-manager')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d0b6e6598ae3dfa864474594021fa010a3c03b16df34c48ec60e0c80cdaf10ea')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DMANUAL_INITS:BOOL="$((!USE_SYSTEMD))" \
		-DDBUS_CONFIG_FILENAME=plasma_org.freedesktop.DisplayManager.conf
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
