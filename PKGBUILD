# Maintainer: Alexandru Ianu <alexandru.ianu@gmail.com>
# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>
pkgname=steam-native
pkgver=1.0.0.50
pkgrel=11
pkgdesc="Sets a native runtime environment for Steam by default, adds a Steam runtime launcher for compatibility."
arch=('i686' 'x86_64')
url="http://steampowered.com/"
license=('GPL2')
install="${pkgname}.install"

source=("steam-runtime.desktop"
	"51-steam.rules")
source_x86_64=("lib32-nm09810.tar.xz")

sha256sums=('8ce140660b4c6295ff0e580a02cebafce1ed22828561304e3f99ee78b8cfdb5d'
	'12d6d0a96e66f10eaeee94ddb6d1048c0e40a8132521fa7b00b844d6454d641c')
sha256sums_x86_64=('b56b9da85e5647ef2b8013d14378b30917d7701cd61b27ba6a39045ab5ecc529')

depends=('steam' 'networkmanager')
depends_i686=('libxinerama' 'pango' 'openal' 'gtk2' 'dbus-glib' 'libusb' 'libnl' 'polkit' 'pam' 'cracklib' 'libtirpc' 'js17' 'libpng12' 'libgcrypt15' 'systemd' 'gconf' 'nss' 'libpulse' 'libgudev' 'libxss')
depends_x86_64=('lib32-libxinerama' 'lib32-pango' 'lib32-openal' 'lib32-gdk-pixbuf2' 'lib32-gtk2' 'lib32-libgcrypt15' 'lib32-libusb' 'lib32-libnl' 'lib32-pam' 'lib32-cracklib' 'lib32-libtirpc' 'lib32-js17' 'lib32-libpng12' 'lib32-systemd' 'lib32-gconf' 'lib32-nss' 'lib32-libsoup' 'lib32-polkit' 'lib32-dbus-glib' 'lib32-libpulse' 'lib32-gnutls28' 'lib32-libgudev' 'lib32-libgl' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxss')

optdepends=('mono: game dependency' 'mono-addins: game dependency')
optdepends_i686=('libappindicator-gtk2: needed if tray icon not working (Gnome)' 'libappindicator-gtk3: needed if tray icon not working (Gnome)' 'sdl: game dependency' 'sdl_image: game dependency' 'sdl_mixer: game dependency' 'sdl2: game dependency' 'sdl2_image: game dependency' 'tcp_wrappers-libs: game dependency' 'speex: game dependency' 'gperftools: game dependency' 'libcurl-gnutls: game dependency')
optdepends_x86_64=('lib32-libappindicator-gtk2: needed if tray icon not working (Gnome)' 'lib32-libappindicator-gtk3: needed if tray icon not working (Gnome)' 'lib32-sdl: game dependency' 'lib32-sdl_image: game dependency' 'lib32-sdl_mixer: game dependency' 'lib32-sdl2: game dependency' 'lib32-sdl2_image: game dependency' 'lib32-tcp_wrappers-libs: game dependency' 'lib32-speex: game dependency' 'lib32-gperftools: game dependency' 'lib32-libcurl-gnutls: game dependency')

provides_i686=('libudev.so.0')
provides_x86_64=('lib32-libudev.so.0' 'lib32-networkmanager=0.9.8.10' 'lib32-libnm-glib=0.9.8.10')

conflicts_i686=('chromium-browser-bin' 'libudev.so.0')
conflicts_x86_64=('chromium-browser-bin' 'lib32-libudev.so.0' 'lib32-networkmanager' 'lib32-libnm-glib46')

package() {
	case "${CARCH}" in
		'i686')
			mkdir -p "${pkgdir}/usr/lib"
			ln -s '/usr/lib/libudev.so' "${pkgdir}/usr/lib/libudev.so.0"
			;;
		'x86_64')
			mkdir -p "${pkgdir}/usr/lib32"
			ln -s '/usr/lib32/libudev.so' "${pkgdir}/usr/lib32/libudev.so.0"
			tar -xJf 'lib32-nm09810.tar.xz' -C "${pkgdir}" --no-same-owner
			;;
	esac

	install -Dm644 'steam-runtime.desktop' "${pkgdir}/usr/share/applications/steam-runtime.desktop"
	install -Dm644 '51-steam.rules' "${pkgdir}/etc/polkit-1/rules.d/51-steam.rules"
	chmod 0700 "${pkgdir}/etc/polkit-1/rules.d" # fix permission warning
}