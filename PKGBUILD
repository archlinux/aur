# Maintainer: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop-bin
pkgver=1.2
pkgrel=3
pkgdesc="Experimental Telegram Desktop fork with option to select custom fonts. - Static binaries"
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)

depends=(
    fontconfig
    hicolor-icon-theme
    libdbus
    libglvnd
    libsm
    desktop-file-utils
)
makedepends=(
    chrpath
)
optdepends=(
    'xdg-desktop-portal: for native file dialogs, do not forget to install one of backends'
    'xdg-utils: for automatic opening of URLs, files and directories in proper applications'
)

conflicts=('kotatogram-desktop' 'kotatogram-desktop-dynamic-bin')
provides=('kotatogram-desktop')

# Sources
source=(
	$pkgname-$pkgver-$pkgrel::$url/releases/download/k$pkgver/$pkgver.tar.xz

	https://raw.githubusercontent.com/kotatogram/kotatogram-desktop/k$pkgver/lib/xdg/kotatogramdesktop.desktop
	
	icon16-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon16.png
	icon32-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon32.png
	icon48-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon48.png
	icon64-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon64.png
	icon128-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon128.png
	icon256-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon256.png
	icon512-$pkgver-$pkgrel.png::$url/raw/k$pkgver/Telegram/Resources/art/icon512.png

)
# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('1b5615d7c47b02c849730070b321196f1903d553ba53119f5a4f411ec2167d9608bdeea30b00c52721ab272074602f60511b60fcf35304fd7a047a79707149b1'
            'e9f0d9174f43cf30b8dc982ce898f5330152cf4d8da03f6e99bd409f6caee7a93f05121d9acdac4ead0c0ef3dfc82ba597b670deac43fe17d08dc221e01e463a'
            '89bb399142ec968a1c9d96e7e3639036aa8d70968c89c6d2b77def5ea6cbb0d88de8b3c8bb10f457600cdd4c7926d7f8ff9907f511aaaac832b218c9353c4b50'
            'facff9860ebb15045e6c7fb6483317c2319bea8b256cbc0986a252863ccedd80e1cf1e4c81a259b303651b450371b1daaf9f61be26129296b71c58ed08644cf9'
            '655bce2e9e55933a733a681e117be0e541cf2f0bdb7b60d9baacaa634b0cf4ba0add53d174807a22449b9ffbbb2b050f24aadb1974d2e471f841d3c227c04c97'
            '1882b6b91c19cc2a5a1bf809f279f3a2c684054a53d26bf1035e61a170e2c6c522a932a32207b1aa7e06437c19403e239ae2b8f258d51996e7edd61f8b93364b'
            'a69ca8c96e9cc3cc1fa3106408bb873c5ac1d41ae40e34b5b1e19784442b590bc6a55567a586d4296f2b7387d6ff714f8b511c068b315b98f5666f9bf8b1217c'
            'b103f3a07c82e7d47602b031c190d902b60b49c0c0750d1e51255cc403286e04b037c66ff0804ce3eb5a7d94fdb2f8219947609f71cc716d44c41d40f4c35344'
            'baba4ba1cb6064fba20b7b85ae9074666e600e2fdbee3626db94a2218ab4e31980a503f09fb043ce17c9e17d57296b479202ae386cbcc5e44a2397aad015b857')

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
	install -Dm644 "$srcdir/icon256-$pkgver-$pkgrel.png" "$pkgdir/usr/share/pixmaps/kotatogram.png"
	install -Dm644 "$srcdir/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"
	
	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}-$pkgver-$pkgrel.png" "$icon_dir/kotatogram.png"
	done
}
