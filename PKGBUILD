# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Yongmeng <yongmengkennyye@protonmail.com>

pkgname=telegreat-bin
pkgver=1.9.8
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
    'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)
conflicts=('telegreat-git')
provides=('telegreat-git')
source=(
	$pkgname.desktop
	tg.protocol
        https://raw.githubusercontent.com/Sea-n/tdesktop/v${pkgver}/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	https://telegre.at/tlinux/tsetup.${pkgver}.tar.xz
)
# Checksums
sha256sums=('5645e109f4eff2555306b5f866c6b0c0f1e7e2ac2569ba55e3f3bc73d46a5750'
            'cebf355fed94f457630557c729b037f0ae4e458b6dba80aae7e50da22c4af206'
            '84af451f2211262c6f277d36c8908682bf8f6ad67edb8f82a9c5b58eeb75c11d'
            '0768d3b7c04c7b742b52457862667bf9a054ab0dab35b18abc1732a8b4b301ea'
            '8265cc98f371f5a9bb24b4d0640476227bb0d6aa66404fc07ef1221b8bf8d1ed'
            '90959f3114feae624e98faaa71118fc9afdf6e3a0f18dcd1a33709815e5d5de4'
            '1f8553272fd701ac8b5dc1ee1b949fa806761da5500d8f39f1be75976ba65744'
            '3a30ea2e58dc4d4d351cf77efb711929a992ec17ee0e07f90de1fa20493a3ff2'
            '3ada582d7465a7f97a197f9d96c358049084ff4f032609de65c5ef93e48c1173'
            'bf482a098a9b81668ba45d426b45ddbf19b086743fab0b4aa7fdec32f6bbd986')

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

