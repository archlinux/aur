# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts. - Static binaries"
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
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
	'gtk2: GTK2-based desktop environment integration'
	'gtk3: GTK3-based desktop environment integration'
	'libappindicator-gtk2: to hide Kotatogram in the tray bar (GTK2-based desktop environment)'
	'libappindicator-gtk3: to hide Kotatogram in the tray bar (GTK3-based desktop environment)'
	'libayatana-appindicator-gtk2: to hide Kotatogram in the tray bar (GTK2-based desktop environment, modern fork)'
	'libayatana-appindicator-gtk3: to hide Kotatogram in the tray bar (GTK3-based desktop environment, modern fork)'
	'libnotify: desktop notifications'
	'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)
conflicts=('kotatogram-desktop' 'telegram-desktop' 'telegram-desktop-bin')
provides=('kotatogram-desktop')

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/releases/download/k$pkgver/$pkgver.tar.xz

	https://raw.githubusercontent.com/kotatogram/kotatogram-desktop/k$pkgver/lib/xdg/tg.protocol
	https://raw.githubusercontent.com/kotatogram/kotatogram-desktop/k$pkgver/lib/xdg/kotatogramdesktop.desktop
	
	$url/raw/master/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png

)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('acddc579ea36efab7731599b2aafcf9d877608c601f1d98aafd3d75c478b0252fe37a510b4f6d980989978cc6e8c105187fd520f341e0905d0426a3a79e633fa'
            'e54c2f5a4cdeff5850828072890679e07da07cfa3663cf9bfb1e6b8f5bca0dc15e6b4b9a2a6c111b796a0440035beea419cda9bf4ec5d476d4fbb54c1b4ad7fd'
            '9f24071d00eabd650a65ed0aa3b231c1de0d0fdc2ec7e305e9e4bb194e4cc643bcb281cdfc3d58765e60410045a4d58d192fdb5aab14ca29e53507c257aef03e'
            '9f4f8d6bbbb54012da0bd9bdf6975ba29fd6ebfca3083995581d815a54e46bc5d4c4d8fedc67f71e892ace08e79179ea6452a7dea0f6ea4f932c1f57ca8497a7'
            '6481cde1cd25c74dd5ad2200f1529d48835590a5ca49cd1650a3cf9dfbc2f391c06fc2a31910742fa7edb3b3369d3795b6e55779f251e3c14fdacbfa033d8579'
            '0a09bc3b0ee9c3d8190ce8069d5cd488c2624f099e0880845dc7ae467d71c48873361e642bb02f3a60425d0334adc8fc40d6b868f9ec534eb4d44e3ec3604c0f'
            'a48793410ca0a5d291a88f2133a78b09aabe099fe6caee384385bca5aa60e52afec913c1678893115c26e98a207ed23ab8ae57af4f80d1437288ce390d03b102'
            '19226b26dbc8b64e079c6fcc0297bc0c246e5d99afe6d48e30cb4d89e82a0d047ddc54e357c2b8991621e9ec06c84ff89c3e74d11c06518b369520d2a38d19ab'
            'bebe3291af9b078cb416f8904149b853f308bd1b4d62c28adbc9593cfb1feca964d520553c6ad3711daf6333ba9793e6a11a50e59d51017e75b8824edfb6bad8'
            '6425975c4062c31da98ca9620c0285a740e407a2e3ea0e1b4d4668d48373cf83eea99260dd3e8f49903347cb2658f95986b7142a1de899a67cacda9383697a7b')

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/Kotatogram/Kotatogram" "$pkgdir/usr/bin/kotatogram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/kotatogram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/kotatogram.png"
	install -Dm644 "$srcdir/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

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
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/kotatogram.png"
	done
}
