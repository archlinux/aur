# Maintainer: Debendra Oli <debendraoli@pm.me>
# Previous Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
# Previous maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Previous maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Previous maintainer:  agnotek <agnostic.sn [at]gmail.com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=telegram-desktop-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Official desktop version of Telegram messaging app - Static binaries"
arch=(x86_64)
url="https://github.com/telegramdesktop/tdesktop"
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
conflicts=(telegram-desktop)
provides=(telegram-desktop)

# Sources
source=(
	"$pkgname.desktop"
	tg.protocol
	$url/raw/master/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	$url/releases/download/v${pkgver}/tsetup.${pkgver}.tar.xz
)

# Checksums
sha256sums=('32d1597d67a7ef519367e499fcc978da4cce104e370b3787853446d93b1533d6'
	'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
	'ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
	'9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
	'041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
	'554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
	'731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
	'3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
	'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119'
	'2dc736552ac1a4aaf4e2a4e73e1588ec53a9f89b1d2d96f9cc113fe87fadb239')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/telegram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

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

	# Disable the official Telegram Desktop updater
	mkdir -p "$pkgdir/etc/tdesktop"
	echo "/usr/bin/telegram-desktop" >"$pkgdir/etc/tdesktop/externalupdater"
}
