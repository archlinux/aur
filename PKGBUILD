# Maintainer: Jane 'polaris' Doe <polaris@airmail.cc>
# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=telegram-desktop-armv7h-bin
pkgver=2.2.0
pkgrel=3
pkgdesc="Telegram Desktop armv7h binaries from Debian"
arch=('armv7h')
url="https://desktop.telegram.org"
license=('GPL3')
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
    'libappindicator-gtk2: to hide Telegram in the tray bar (GTK2-based desktop environment)'
    'libappindicator-gtk3: to hide Telegram in the tray bar (GTK3-based desktop environment)'
    'libappindicator-sharp: to hide Telegram in the tray bar (Unity-based desktop environment)'
    'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)
conflicts=('telegram-desktop' 'telegram-desktop-git')
provides=('telegram-desktop')

# Sources
source=(
	"$pkgname.desktop"
	"http://ftp.us.debian.org/debian/pool/main/t/telegram-desktop/telegram-desktop_${pkgver}%2Bds-${pkgrel}_armhf.deb"
	)
# Checksums
sha256sums=('32d1597d67a7ef519367e499fcc978da4cce104e370b3787853446d93b1533d6'
            'a774b37abf3eda376664b784e206421c5e157e0bc2abb79526d8dab87e2040d3')

package() {

	cd "$srcdir/"

	# Unarchive Deb

	ar vx "$srcdir/telegram-desktop_${pkgver}%2Bds-${pkgrel}_armhf.deb"
	tar -xf "$srcdir/data.tar.xz"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/usr/bin/telegram-desktop" "$pkgdir/usr/bin/telegram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/telegram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/telegram.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm644 "$srcdir/usr/share/applications/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

	# KDE4 protocol file
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/usr/share/kde4/services/tg.protocol" "$pkgdir/usr/share/kde4/services/tg.protocol"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/telegram.png" "$icon_dir/telegram.png"
	done
}

