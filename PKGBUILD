# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='beekeeper-studio'
pkgname="$_pkgname-ultimate"
pkgver='4.3.1'
pkgrel='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more - Ultimate edition'
arch=('x86_64' 'aarch64')
url="https://github.com/$_pkgname/ultimate-releases"
license=('LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron18'
depends=("$_electronpkg")
options=('!strip')
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/Beekeeper-Studio-Ultimate-$pkgver.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::$url/releases/download/v$pkgver/Beekeeper-Studio-Ultimate-$pkgver-arm64.AppImage")
source=(
	'electron-launcher.sh'
	'LICENSE.md'
)
sha512sums=('e6b9a9ac3c62cc2b040c4ece48ab27a29e1ba8fbf2c3d45f299aeb7c2b0a967acb8e84171f5d71f63ebedba52a8f376beab40e8889bda668341aa1d9da50bd47'
            'be5c22a33b22a82c0a308ecfe66443915828a4f7f82f696dc429dcd4c8ea7e9f2a1087123c0fe3dc0599f9d7defe505fb88c18a52eb0b31f2d81f2e798090ef7')
sha512sums_x86_64=('02ae0f731587d262590d0b82af6457a0f1db411e404be6532c5fd62817f34b9e50804089f8b557b0cd9fb56d5840f6bd5e732639c109371d91e6c6b5a0eee1dc')
sha512sums_aarch64=('69e316c2b41e0db7b5fc28661d8b9d5de6bf994c10897fbf1b7ebd8f0597d79075077adb9064d63add3aed3ebb5b31fd3f952c6305fe314e81074d2bfab7e520')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/"

	# Extract AppImage
	chmod +x "$pkgname-$pkgver-$CARCH.AppImage"
	"./$pkgname-$pkgver-$CARCH.AppImage" --appimage-extract
	mv "$srcdir/squashfs-root/" "$srcdir/$_sourcedirectory/"

	# Replace package name, flag file name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e "s/%%FLAGFILENAME%%/bks/g" 'electron-launcher.sh'
}

# No functionality to test, as the binary has no --help or --version

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Electron resources
	install -Dm644 'resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'resources/public/' "$pkgdir/usr/lib/$pkgname/public/"
	chmod 755 "$pkgdir/usr/lib/$pkgname/public/" "$pkgdir/usr/lib/$pkgname/public/icons/" "$pkgdir/usr/lib/$pkgname/public/icons/mac/" "$pkgdir/usr/lib/$pkgname/public/icons/png/" "$pkgdir/usr/lib/$pkgname/public/icons/win/"

	# Binary
	install -Dm755 "$srcdir/electron-launcher.sh" "$pkgdir/usr/bin/$pkgname"

	# Misc files
	for _size in '16' '24' '32' '48' '64' '96' '128' '256' '512' '1024'; do
		install -dm755 "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/"
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
	done

	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime/' "$pkgdir/usr/share/mime/"
	chmod 755 "$pkgdir/usr/share/mime/"

	install -dm755 "$pkgdir/usr/share/applications/"
	install -Dm644 'beekeeper-studio.desktop' "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/BeekeeperStudioApplicationEULA"

	# Update desktop file
	sed "s|^Exec=.*$|Exec=$pkgname %U|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed "s|^Icon=$_pkgname|Icon=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
