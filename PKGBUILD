# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='beekeeper-studio'
pkgname="$_pkgname-ultimate"
pkgver='4.6.8'
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
b2sums=('54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'b5f0a224b71c8ec5966333cc24bdd59a58728175448e88a4779e100823b76f25088a934775ba5eb2c13d110e4f5889d11d2a0c3ee3b965489f644561659dd176')
b2sums_x86_64=('d00b45d3e28d4f537cea515f6ff289c8e0532be808e57f31c982653c6cfad30b269231c0c80cb7dfd61d640f4a90943961e4f1393f345b79129e9f7f050dd3a1')
b2sums_aarch64=('9213b8680e929ea491d3837d2aaea8c0584935c908b433f2e29d10bfb1750201c1d2bca61b4e3512049253a9883de975cc7f7407989e727ee602036dec5ba0f6')

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
