# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-desktop-interface
pkgver=6.8.0.3
pkgrel=2
pkgdesc='Sonic Desktop Interface'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-desktop-interface'
license=('LGPL-2.0-or-later')
depends=(
	'emoji-font' # for clock and language KCMs
	'glibc'
	'libcanberra'
	'libstdc++'
	'libudev.so'
	'libwacom'
	'libx11'
	'libxcb'
	'libxcursor'
	'libxi'
	'libxkbcommon'
	'libxkbfile'
	'qt6-base'
	'qt6-declarative'
	'sdl2'
	'sonic-activities'
	'sonic-activities-stats'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-bookmarks'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-data-views'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-file-search'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notification-settings'
	'sonic-frameworks-notifications'
	'sonic-frameworks-open-collab'
	'sonic-frameworks-package'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-runner'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-spell-check'
	'sonic-frameworks-svg'
	'sonic-frameworks-text-codec'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-launcher-menu-edit'
	'sonic-pipewire'
	'sonic-plasma5-support-library'
	'sonic-polkit-agent'
	'sonic-power-management'
	'sonic-system-monitor-library'
	'sonic-system-settings'
	'sonic-workspace'
	'xcb-util-keysyms'
	'xdg-user-dirs'
)
optdepends=(
	'glib2: kimpanel IBUS support'
	'ibus: kimpanel IBUS support'
	'packagekit-qt6: to install new sonic-frameworks-runner plugins'
	'scim: kimpanel SCIM support'
	'sonic-accounts-integration: OpenDesktop integration plugin'
	'sonic-audio-applet-pulse: Audio volume applet'
	'sonic-bluetooth-runtime: Bluetooth applet'
	'sonic-network-manager: Network manager applet'
	'sonic-qt-accounts-library: OpenDesktop integration plugin'
	'sonic-screen: screen management'
)
makedepends=(
	'intltool'
	'libibus'
	'packagekit-qt6'
	'scim'
	'sonic-accounts-integration'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
	'xf86-input-evdev'
	'xf86-input-libinput'
	'xf86-input-synaptics'
	'xorg-server-devel'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: login1 D-Bus service'
	'esettingsd: timedate1 D-Bus service for dinit, runit or s6'
	'openrc-settingsd: timedate1 D-Bus service for OpenRC'
)
provides=('plasma-desktop')
conflicts=('plasma-desktop')
groups=('sonicde')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'0001-add-explicit-input-backend-options.patch'
)
sha256sums=('fa79b80cb7d7e55484b40c498ccc9d39a794c62029b72182dc3b1973be5be211'
            '63afec950ae88f89fcf206b8e40aab3dcc4f5a4df6f456b31ad3ebf20158f440')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 < "$srcdir/0001-add-explicit-input-backend-options.patch"
}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_KCM_MOUSE_EVDEV=ON \
		-DBUILD_KCM_TOUCHPAD_SYNAPTICS=ON \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
