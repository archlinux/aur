# Maintainer: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop-bin
pkgver=2.8.11.1
pkgrel=1
pkgdesc="Unofficial desktop version of Telegram messaging app - binary version"
arch=(x86_64)
url="https://github.com/TDesktop-x64/tdesktop"
license=(GPL3)
depends=(desktop-file-utils glib2 hicolor-icon-theme libdbus libx11)
optdepends=('ttf-opensans: default Open Sans font family')
conflicts=(telegram-desktop 64gram-desktop)
provides=(64gram-desktop)

source=(
	"${url}/raw/dev/lib/xdg/telegramdesktop.desktop"
	${url}/raw/dev/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	"${url}/releases/download/v${pkgver}/64Gram_${pkgver}_linux.zip"
)
sha256sums=('324e312734dfae1f36eb71aaeb5072f6f051171cf067ff22a4517fde5102e27a'
            'fc052d1e28b68761bfb6c30ff012e54a4bba0311fc3fc470c728d028c33e9d9f'
            '8ae874ada23687c95cbcfe7cfa4cbe1c37f097d9c96e5a836c20109d976a86c7'
            '57d9c71074a619dbe6c361e49f4bee60b1b8c574d8b223d75e61b3744b660ed1'
            '10507a1ddc379b00230c6f6e2bd9f94ea0c7caff9cae05335a66b4d10b7571eb'
            '83e3e8eeecadcb3429704626d4ac80ef61ef4e06ba2c6ca2b105a4a436f33032'
            '871f2a6d3bd9d657f8379196e51fd3117c1586e0042e9e993ae138f78b2bcd76'
            'a9eb77ca5a428b32f6e01f62b859cce788c4c9a170dc2cd080800a9de59faa3d'
            'a102fdf2a91e3e374dce6c17e9a9dd5b0c1cd23d41d3f142fc0acb37623d053b')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/telegram.png"
	install -Dm644 "$srcdir/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

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
