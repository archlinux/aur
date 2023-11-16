# Maintainer: westpain <homicide@disroot.org>
# Co-maintainer: DiamivaeBro <assassinssamsa@gmail.com>
# PKGBUILD version: v2.0
pkgname=ayugram-desktop-bin
pkgver=4.11.1
pkgrel=3
pkgdesc="Unofficial desktop version of Telegram messaging app with ToS breaking features in mind - Static binaries"
arch=(x86_64)
url="https://github.com/AyuGram/AyuGramDesktop"
license=(GPL3)
depends=('desktop-file-utils' 'glib2' 'ffmpeg' 'sqlite' 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'protobuf' 'rnnoise' 'openssl' 'hicolor-icon-theme' 'libdbus' 'libx11' 'libglvnd' 'fontconfig')
makedepends=('chrpath')
optdepends=('webkit2gtk: embedded browser features'
	    'xdg-desktop-portal: desktop integration')
provides=('ayugram-desktop')
conflicts=('ayugram-desktop')

# Archive source
source=(
  https://git.killarious.org/ayugram-releases/archlinux-bin/raw/tag/${pkgver}/archlinux_ayugram_v${pkgver}.tar.gz
)

# Checksums
sha256sums=('5a79b7ac4c8f94e777556683b2d5040310e9e49280915662f2666c9dd7e0e012')

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
	install -Dm755 "$srcdir/usr/bin/ayugram-desktop" "$pkgdir/usr/bin/ayugram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/ayugram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/ayugram.png" "$pkgdir/usr/share/pixmaps/ayugram.png"
	install -Dm644 "$srcdir/usr/share/applications/ayugram.desktop.desktop" "$pkgdir/usr/share/applications/ayugram.desktop.desktop"

	# DBus service
	install -Dm644 "$srcdir/usr/share/dbus-1/services/ayugram.desktop.service" "$pkgdir/usr/share/dbus-1/services/ayugram.desktop.service"

	# Metainfo
	install -Dm644 "$srcdir/usr/share/metainfo/ayugram.desktop.metainfo.xml" "$pkgdir/usr/share/metainfo/ayugram.desktop.metainfo.xml"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/ayugram.png" "$icon_dir/ayugram.png"
	done
}
