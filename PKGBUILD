# Maintainer: Yongmeng <yongmengkennyye@protonmail.com>
pkgname=telegreat-bin
pkgver=1.3.12
pkgrel=1
pkgdesc="Unofficial Telegreat Messaging app - Static binaries"
arch=('x86_64')
url="https://telegre.at"
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
conflicts=('telegreat-git')
provides=('telegreat-git')
source=(
	$pkgname.desktop
	tg.protocol
	https://raw.githubusercontent.com/Sea-n/tdesktop/master/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	https://telegre.at/tlinux/tsetup.${pkgver}.alpha.tar.xz
)
# Checksums
sha256sums=('5645e109f4eff2555306b5f866c6b0c0f1e7e2ac2569ba55e3f3bc73d46a5750'
            'cebf355fed94f457630557c729b037f0ae4e458b6dba80aae7e50da22c4af206'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f0f91bf6f3eb18f7814af1ea886319866f05efd4d8fb53a510ab9d627cb44725'
)

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegreat/Telegreat" "$pkgdir/usr/bin/telegreat"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/telegreat"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/telegreat.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/telegreat.desktop"

	# KDE4 protocol file
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kde4/services/tg.protocol"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/telegreat.png"
	done
}

