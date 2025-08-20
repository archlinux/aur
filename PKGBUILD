# Maintainer: ThisIsAstral 
# ВНИМАНИЕ: Этот пакет создан в шутку, я не имею ничего против Дибоф
pkgname=max-patched
pkgver=6.0.2
pkgrel=1
pkgdesc="Fix Version Max"
arch=(x86_64)
url="https://github.com/telegramdesktop/tdesktop"
license=(MIT)
depends=(fontconfig glib2 hicolor-icon-theme glibc libx11 freetype2 qt6-base)
makedepends=(chrpath)
optdepends=(
	'libappindicator-gtk2: to hide Telegram in the tray bar in GTK2-based desktop environment'
	'libappindicator-gtk3: to hide Telegram in the tray bar in GTK3-based desktop environment'
	'xdg-utils: for automatic opening of URLs, files and directories in proper applications')
conflicts=(max-patched)
provides=(max-patched)
source=(
	"org.max-patched.desktop"
	max-patched.protocol
	$url/raw/master/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	$url/releases/download/v${pkgver}/tsetup.${pkgver}.tar.xz)

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	install -Dm755 "$srcdir/Telegram/Telegram" "$pkgdir/usr/bin/max-patched-desktop"

	chrpath --delete "$pkgdir/usr/bin/max-patched-desktop"

	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/max-patched.png"
	install -Dm644 "$srcdir/org.max-patched.desktop" "$pkgdir/usr/share/applications/org.max-patched.desktop"

	install -d "$pkgdir/usr/share/kservices5"
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/max-patched.protocol" "$pkgdir/usr/share/kservices5/max-patched.protocol"
	ln -s "/usr/share/kservices5/max-patched.protocol" "$pkgdir/usr/share/kde4/services"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/max-patched.png"
	done

	mkdir -p "$pkgdir/usr/share/MaxPatched/externalupdater.d"
	echo "/usr/bin/max-patched-desktop" >"$pkgdir/usr/share/MaxPatched/externalupdater.d/max-patched.conf"
}

sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c'
            '9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c'
            '041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2'
            '554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9'
            '731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6'
            '3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090'
            'e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119'
            '0ad44033a3640fe9f11b435b8e5e0132812f636dc2b3112fddf265fdf252e264')
