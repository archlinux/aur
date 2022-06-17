# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Controbutor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=forkgram-bin
_pkgname=forkgram
pkgver=3.7.6
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
sha256sums=('71e6bd9c75b4ad63e081fa2eec11f011a230d3179d2a709e3787e6f4f2345d9b'
            '84a582c3bfd209b85727cfa88bfdea794e4bb6b60c6a449a411e105c5e1bd9f1'
            '9fd7d8ce9c4246ed414ddf15c2a19f6df1a749c1e6cb23ac1aac2fc0e6152fe7'
            '13c5b79d31f123ba4da10d57f93e11bf9490c78476dc44758a9d58f6b4488f0a'
            '371dfd02eb3f9a5e69d0a6dd81d931bfc9fdf749cf4700c9c8def82bf0452701'
            '36fe2468f41996ed464d39da17c1518c23e230569a10d32fa96c84a492a8e6c0'
            '6579cb28df4d36f0bb7944434c3c00b08f09f387d7c89e8e53c05af1f5b15d91'
            '0b8ab0a5f1dbd15e0496a119afb28f684e29b7fe731d5540a417b89195297022'
            'c51a86c6fef238ef3ba4e25337be44548e7f5d358faec8075980929581663c96'
            '11c609c98c14628f3bcef080be6e8005fc30b26aea01605a0c629f7e142065bf')
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
