# Maintainer: westpain <homicide@disroot.org>
pkgname=ayugram-desktop-bin
pkgver=4.8.11
pkgrel=1
pkgdesc="Unofficial desktop version of Telegram messaging app with ToS breaking features in mind - Static binaries"
arch=(x86_64)
url="https://github.com/AyuGram/AyuGramDesktop"
license=(GPL3)
depends=(
	desktop-file-utils
	glib2
	hicolor-icon-theme
	libdbus
	libx11
)
makedepends=(
	chrpath
)
optdepends=(
	'libappindicator-gtk2: to hide Telegram in the tray bar in GTK2-based desktop environment'
	'libappindicator-gtk3: to hide Telegram in the tray bar in GTK3-based desktop environment'
	'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)
provides=(telegram-desktop)

# Sources
source=(
	"com.ayugram.desktop.desktop"
	tg.protocol
	$url/raw/dev/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
  http://0x0.st/HL7_.tar.xz
)

# Checksums
sha256sums=('SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP'
	          'SKIP')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/AyuGram/ayugram-desktop" "$pkgdir/usr/bin/ayugram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/ayugram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm644 "$srcdir/com.ayugram.desktop.desktop" "$pkgdir/usr/share/applications/com.ayugram.desktop.desktop"

	# KDE5 & KDE4 protocol file
	install -d "$pkgdir/usr/share/kservices5"
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"
	ln -s "/usr/share/kservices5/tg.protocol" "$pkgdir/usr/share/kde4/services"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/telegram.png"
	done
}
