# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>
pkgname=telegram-desktop-dev-bin
pkgver=6.3.6
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

# Sources
source=(
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon16.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon32.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon48.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon64.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon128.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon256.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/Telegram/Resources/art/icon512.png
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/lib/xdg/org.telegram.desktop.desktop
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/lib/xdg/org.telegram.desktop.service
	https://github.com/telegramdesktop/tdesktop/raw/v${pkgver}/lib/xdg/org.telegram.desktop.metainfo.xml
)
# If this is a dev version
if [ $_dev == 1 ]
then
	_devsuffix=".beta"
else
	_devsuffix=""
fi

# Select the best one accordingly.
source_x86_64=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tsetup.${pkgver}${_devsuffix}.tar.xz")
#source_x86_64=("https://updates.tdesktop.com/tlinux/tsetup.${pkgver}${_devsuffix}.tar.xz")
# Old 32-bit sources:
#source_i686=('https://updates.tdesktop.com/tlinux32/tsetup32.'${pkgver}${_devsuffix}'.tar.xz')
#source_i686=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tsetup32.${pkgver}${_devsuffix}.tar.xz")

# Checksums
sha256sums=('ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
            '9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
            '041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
            '554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
            '731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
            '3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
            'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119'
            '3b737f1dc1b5b8de17a961c052cb5924baecf3dbf0931012ff2d20169fb42d4d'
            'dd3c5d50ab70e528bf807c4f273a67c164392016779057aa1954fd6c7151c9d0'
            '74dd34f9206d06d9e5e14aa9773d387a1ba82f5bdb2aa3482cdf4b1ed76169fe')
sha256sums_x86_64=('3fbdec5a6b77451d8d4f67bbbfb2e6164f50c7a4c38e48963c821b407bf65b64')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Program
	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/telegram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/org.telegram.desktop.desktop" -t "$pkgdir/usr/share/applications/"

	# D-BUS activation service
	install -Dm644 "$srcdir/org.telegram.desktop.service" -t "$pkgdir/usr/share/dbus-1/services/"

	# App metainfo
	install -Dm644 "$srcdir/org.telegram.desktop.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -dm755 "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/telegram.png"
	done
}
