# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-workspace
pkgver=6.8.0.4
pkgrel=2
pkgdesc='SonicDE workspace components'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-workspace'
license=('LGPL-2.0-or-later')
depends=(
	'accountsservice'
	'appstream-qt'
	'dbus'
	'fontconfig'
	'freetype2'
	'glibc'
	'icu'
	'libcanberra'
	'libgcc'
	'libice'
	'libqalculate'
	'libsm'
	'libstdc++'
	'libudev.so'
	'libx11'
	'libxau'
	'libxcb'
	'libxcrypt'
	'libxcursor'
	'libxfixes'
	'libxft'
	'libxtst'
	'qt6-base'
	'qt6-declarative'
	'qt6-location'
	'qt6-positioning'
	'qt6-svg'
	'qt6-tools' # for qdbus
	'sh'
	'sonic-activities'
	'sonic-activities-stats'
	'sonic-activity-manager-daemon'
	'sonic-daemon'
	'sonic-exiv2-library'
	'sonic-file-search-ui'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-archive'
	'sonic-frameworks-auth'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-barcode'
	'sonic-frameworks-bookmarks'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-holidays'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-idle-tracker'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-io-extras'
	'sonic-frameworks-io-fuse'
	'sonic-frameworks-keybind'
	'sonic-frameworks-keyring'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-charts'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-runner'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-svg'
	'sonic-frameworks-text-editor'
	'sonic-frameworks-text-widgets'
	'sonic-frameworks-ui-components'
	'sonic-frameworks-user-feedback'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-interface-libraries'
	'sonic-keyboard'
	'sonic-night-light'
	'sonic-pipewire'
	'sonic-screenlocker'
	'sonic-silver-sound-theme'
	'sonic-system-monitor-library'
	'sonic-system-stats'
	'sonic-terminal-tools'
	'sonic-win'
	'xcb-util'
	'xcb-util-cursor'
	'xcb-util-image'
	'xcb-util-wm'
	'xorg-xmessage'
	'xorg-xrdb'
	'zlib'
)
((USE_SYSTEMD)) && depends+=('systemd-libs')
makedepends=(
	'qcoro'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
	'sonic-frameworks-file-search'
	'sonic-frameworks-networkmanager'
)
((USE_SYSTEMD)) && makedepends+=('systemd')
optdepends=(
	'appmenu-gtk-module: global menu support for some GTK3 applications'
	'discover: manage applications installation from the launcher'
	'kdepim-addons: displaying PIM events in the calendar'
	'plasma5-integration: use Plasma settings in Qt5 applications'
	'sonic-frameworks-file-search: file search runner'
	'sonic-frameworks-networkmanager: IP based geolocation'
	'sonic-workspace-wallpapers: additional wallpapers'
	'xdg-desktop-portal-gtk: sync font settings to Flatpak apps'
)
((USE_SYSTEMD)) || optdepends+=(
	'elogind: login1 service for session and power management'
	'esettingsd: timedate1 and locale1 services for dinit, runit or s6'
	'openrc-settingsd: timedate1 and locale1 services for OpenRC'
)
provides=(
	'plasma-workspace'
	'plasma-x11-session'
	'sonic-x11-session'
)
conflicts=(
	'plasma-workspace'
	'plasma-x11-session'
	'sonic-x11-session'
)
replaces=('sonic-x11-session')
groups=('sonicde')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	'build-systemd-option.patch'
)
sha256sums=('7101b124adc183d7dab4e6af9e04afd7f224f76c48ea80274874f055641ad187'
            '46d21bdb2347afe7ee313196f4296cfc91f4e16e68eca9f0da3dcae42663a63d')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 < "$srcdir/build-systemd-option.patch"
}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DGLIBC_LOCALE_GEN=OFF \
		-DBUILD_SYSTEMD="$USE_SYSTEMD" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
