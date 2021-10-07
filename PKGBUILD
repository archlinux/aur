# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Controbutor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: agnotek <agnostic.sn [at]gmail.com>

pkgname=forkgram-bin
_pkgname=forkgram
pkgver=3.1.7
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
	"https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/Telegram.tar.xz"
	"$pkgname.desktop"
	tg.protocol
	"${_pkgname}.png::https://user-images.githubusercontent.com/4051126/43634235-402a8b74-9714-11e8-85c0-8ceb0844a3b0.png"
)

# Checksums
sha256sums=('1958cf1bd52357804e9415a3772fecd5657607072e7d5b0497721450ed25ef1a'
            'd120aa0e034fe8d8edf6f91ce81ab9bbf2ce8b2760df75fb9a5416860135700f'
            '9fd7d8ce9c4246ed414ddf15c2a19f6df1a749c1e6cb23ac1aac2fc0e6152fe7'
            'a82426db2c86b32ea38d274d98ed741f51f7488643061fdf7749966208095f8b')
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
	install -Dm644 "$srcdir/${_pkgname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

	# KDE5 & KDE4 protocol file
	install -d "$pkgdir/usr/share/kservices5"
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"
	ln -s "/usr/share/kservices5/tg.protocol" "$pkgdir/usr/share/kde4/services"

	# Disable the official Telegram Desktop updater
	#mkdir -p "$pkgdir/etc/tdesktop"
	#echo "/usr/bin/Forkgram" > "$pkgdir/etc/tdesktop/externalupdater"
}
