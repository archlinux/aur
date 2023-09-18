# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Controbutor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=forkgram-bin
_pkgname=forkgram
pkgver=4.9.8
pkgrel=1
pkgdesc="Forkgram is the fork of the official Telegram Desktop application - Static binary"
arch=(x86_64)
url="https://github.com/Forkgram/tdesktop"
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

# Sources
source=(
	"${_pkgname}-${pkgver}.tar.xz::https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/Telegram.tar.xz"
	"$pkgname.desktop"
	tg.protocol
	https://raw.githubusercontent.com/Forkgram/tdesktop/dev/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png)
	#"${_pkgname}.png::https://user-images.githubusercontent.com/4051126/43634235-402a8b74-9714-11e8-85c0-8ceb0844a3b0.png"


# Checksums
sha256sums=('df791f24fa0861ee609c6170b628035e84aa9ad99baa6706c322a41058e26b13'
            '84a582c3bfd209b85727cfa88bfdea794e4bb6b60c6a449a411e105c5e1bd9f1'
            '9fd7d8ce9c4246ed414ddf15c2a19f6df1a749c1e6cb23ac1aac2fc0e6152fe7'
            'ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
            '9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
            '041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
            '554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
            '731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
            '3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
            'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram" "$pkgdir/usr/bin/Forkgram"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/Forkgram"

	# Desktop launcher
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

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
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/${_pkgname}.png"
	done

	# Disable the official Telegram Desktop updater
	mkdir -p "$pkgdir/etc/tdesktop"
	echo "/usr/bin/Forkgram" > "$pkgdir/etc/tdesktop/externalupdater"
}
