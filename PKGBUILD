# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='beekeeper-studio'
pkgname="$_pkgname-ultimate"
pkgver='4.0.2'
pkgrel='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more - Ultimate edition'
arch=('x86_64' 'aarch64')
url="https://github.com/$_pkgname/ultimate-releases"
license=('custom:Beekeeper Studio Application EULA')
_electronpkg='electron18'
depends=("$_electronpkg")
options=('!strip')
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/Beekeeper-Studio-Ultimate-$pkgver.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::$url/releases/download/v$pkgver/Beekeeper-Studio-Ultimate-$pkgver-arm64.AppImage")
source=(
	'electron-launcher.sh'
	'LICENSE.md'
)
sha512sums=('7550a585f23262f12aa997007f3ccb47272baf9bdeec7789a033775c6683fc9d1b4a29eee02d132c3d441b6abd2d96b9018469990b1638633d24ea90abea9371'
            'be5c22a33b22a82c0a308ecfe66443915828a4f7f82f696dc429dcd4c8ea7e9f2a1087123c0fe3dc0599f9d7defe505fb88c18a52eb0b31f2d81f2e798090ef7')
sha512sums_x86_64=('005a91eadc6943fb05f6e4e342db0249dd5a302f02d717b064cb6052ab096cf87309a308d7a3c626123792a3c584dc8c7fb7dd214765993ff5ac15a22c5b6740')
sha512sums_aarch64=('45394fb46820e4fa91ffe76c9567abe4304052f73715e3cbe2d2e0331bf5b41cbcdbcf874d55c8913c635a93d460adf92196021157540c39d9fbf95038112cc7')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/"

	# Extract AppImage
	chmod +x "$pkgname-$pkgver-$CARCH.AppImage"
	"./$pkgname-$pkgver-$CARCH.AppImage" --appimage-extract
	mv "$srcdir/squashfs-root/" "$srcdir/$_sourcedirectory/"

	# Replace package name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" 'electron-launcher.sh'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Electron resources
	install -Dm644 'resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'resources/public/' "$pkgdir/usr/lib/$pkgname/public/"

	# Binary
	install -Dm755 "$srcdir/electron-launcher.sh" "$pkgdir/usr/bin/$pkgname"

	# Misc files
	for _size in '16' '24' '32' '48' '64' '96' '128' '256' '512' '1024'; do
		install -dm755 "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/"
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
	done

	install -dm755 "$pkgdir/usr/share/mime/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	install -dm755 "$pkgdir/usr/share/applications/"
	install -Dm644 'beekeeper-studio.desktop' "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	# Update desktop file
	sed "s|^Exec=.*$|Exec=$pkgname %U|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed "s|^Icon=$_pkgname|Icon=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
