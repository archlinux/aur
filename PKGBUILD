# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-readonly-beta'
_edition=' Readonly Beta'
pkgname="mongodb-$_target"
_pkgver='1.27.0-beta.10'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Readonly Edition - beta version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('electron6-bin' 'krb5' 'libsecret' 'lsb-release')
makedepends=('git' 'nodejs-lts-erbium' 'npm>=7.0.0' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build.diff'
)
sha512sums=('d8f312c61c23700235197156bc5f931a8b425a982064e010f09614b7451601655f11ca335b91786b52c0cbc7dce447ddda031b025c441436668d58fd9949d8b7'
            '9c93c8aa513c9238e04bb860626d09f1e83643cbfd1b8cd66add35cd41e6a7172fedff42f9f9eeedb0e8a3d6b852e1671a8b5a1fa3066d7dd5a543052392946d')

_sourcedirectory="compass-$_pkgver"
_homedirectory="$pkgname-$pkgver-$pkgrel-home"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node -v | sed 's/^v//')"'"|' 'packages/compass/package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron6/version')"'"|' 'packages/compass/package.json'

	# Prepare dependencies
	HOME="$srcdir/$_homedirectory" npm run bootstrap

	# Apply hadron-build fixes
	patch -d 'node_modules/hadron-build/' --forward -p1 < "$srcdir/hadron-build.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	NODE_ENV='production' HOME="$srcdir/$_homedirectory" npm run package-compass "${_target%-beta}"
}

package() {
	local _distFolder="$srcdir/$_sourcedirectory/packages/compass/dist/MongoDB Compass$_edition-linux"
	case "$CARCH" in
		i686)
			_distFolder="$_distFolder-ia32"
		;;
		armv7h)
			_distFolder="$_distFolder-armv7l"
		;;
		aarch64)
			_distFolder="$_distFolder-arm64"
		;;
		*)
			_distFolder="$_distFolder-x64"
		;;
	esac
	cd "$_distFolder/"

	install -Dm644 'resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'resources/app.asar.unpacked/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
NODE_ENV=production exec electron6 '/usr/lib/$pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=MongoDB Compass$_edition
Comment=The official GUI for MongoDB
Exec=$pkgname %U
Icon=$pkgname
Type=Application
StartupNotify=true
Categories=Office;Database;Building;Debugger;IDE;GUIDesigner;Profiling;
EOF

	install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/src/app/images/linux/mongodb-compass.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
