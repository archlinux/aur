# Maintainer: westpain <homicide@disroot.org>
pkgname=materialgram-bin
pkgver=4.11.1.1
pkgrel=1
pkgdesc="Unofficial desktop version of Telegram messaging app with Material Design - Static binaries"
arch=(x86_64)
url="https://github.com/kukuruzka165/materialgram"
license=(GPL3)
depends=('desktop-file-utils' 'glib2' 'ffmpeg' 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'protobuf' 'rnnoise' 'openssl' 'hicolor-icon-theme' 'libdbus' 'libx11' 'libglvnd' 'fontconfig')
makedepends=('chrpath')
optdepends=('webkit2gtk: embedded browser features'
	    'xdg-desktop-portal: desktop integration')
provides=('materialgram')
conflicts=('materialgram')

# Archive source
source=(
	https://github.com/kukuruzka165/materialgram/releases/download/v${pkgver}/archlinux_materialgram_v${pkgver}.tar.gz
)

# Checksums
sha256sums=('c8b97eec492e3afd3f9ab6a2fd0ac9f30149016130dc740e715c57f9559bf284')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share"
	install -dm755 "$pkgdir/usr/share/applications"
	install -dm755 "$pkgdir/usr/share/dbus-1"
	install -dm755 "$pkgdir/usr/share/icons"
	install -dm755 "$pkgdir/usr/share/pixmaps"
	install -dm755 "$pkgdir/usr/share/metainfo"

	# Application executable
	install -Dm755 "$srcdir/usr/bin/materialgram" "$pkgdir/usr/bin/materialgram"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/materialgram"

	# Desktop launcher
	install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/materialgram.png" "$pkgdir/usr/share/pixmaps/materialgram.png"
	install -Dm644 "$srcdir/usr/share/applications/materialgram.desktop" "$pkgdir/usr/share/applications/materialgram.desktop"

	# DBus service
	install -Dm644 "$srcdir/usr/share/dbus-1/services/materialgram.service" "$pkgdir/usr/share/dbus-1/services/materialgram.service"

	# Metainfo
	install -Dm644 "$srcdir/usr/share/metainfo/materialgram.metainfo.xml" "$pkgdir/usr/share/metainfo/materialgram.metainfo.xml"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/materialgram.png" "$icon_dir/materialgram.png"
	done
}
