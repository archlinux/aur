# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>
pkgname=telegram-desktop-bin-dev
pkgver=4.6.3
pkgrel=1
# If it is a dev-only version, set this to 1
_dev=0
pkgdesc="Official desktop version of Telegram messaging app - Static binaries, developement version"
# Last i686 beta: 2.1.22
# Checked via: curl -iL https://telegram.org/dl/desktop/linux32?beta=1
arch=(x86_64)
url="https://desktop.telegram.org"
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
conflicts=(telegram-desktop telegram-desktop-bin)
provides=(telegram-desktop)
replaces=(telegram-bin)

# Sources
source=(
	"$pkgname.desktop"
	tg.protocol
	https://github.com/telegramdesktop/tdesktop/raw/master/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
)
# If this is a dev version
if [ $_dev == 1 ]
then
	_devsuffix=".beta"
else
	_devsuffix=""
fi

source_x86_64=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tsetup.${pkgver}${_devsuffix}.tar.xz")
# If your ISP blocks Github
#source_x86_64=("https://updates.tdesktop.com/tlinux/tsetup.${pkgver}${_devsuffix}.tar.xz")
# Old 32-bit sources:
#source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'${pkgver}${_devsuffix}'.tar.xz')
#source_i686=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tsetup32.${pkgver}${_devsuffix}.tar.xz")

# Checksums
sha256sums=('32d1597d67a7ef519367e499fcc978da4cce104e370b3787853446d93b1533d6'
            'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
            'ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
            '9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
            '041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
            '554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
            '731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
            '3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
            'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119')
sha256sums_x86_64=('abf75f01f77993098c3a7c5deec7606698ca029507e8084ac6104f44a3e971a9')
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
	echo "/usr/bin/telegram-desktop" > "$pkgdir/etc/tdesktop/externalupdater"
}
