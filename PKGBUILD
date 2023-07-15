# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-beta'
_edition=' Beta'
pkgname="mongodb-$_target"
_pkgver='1.39.0-beta.2'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version'
# If you're running on armv7h or aarch64, use the electron23-bin package from the AUR for the electron23 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron23-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
_electronpkg='electron23'
depends=("$_electronpkg" 'krb5' 'libsecret' 'lsb-release')
makedepends=('git' 'nodejs>=16.15.1' 'npm>=8.19.4' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build-ffmpeg.diff'
	'hadron-build-os-dns-native.diff'
	'fix-argv.diff'
)
sha512sums=('c0bf8bab5894fdb565aa6002db9fbd1b16a8cd353593ae64b256fc2c88e7b1972b741b6ebd762f8eb8d2ccceaeb998abe16662148b0d1e6102bfcb6331808f4e'
            '54faea6c77fc7ac6ffcd81667d85103d0dcbe51b2358480e3e47fa4b0db70cdd87578da412d101d1d6b5f85039c4f3119caad9dc327fe6da1510d145bafb476b'
            'e1082fd804ba72ccf3e53576077562f8b159b76e6aa07fa2324e31dd45c0d863d844fbb8be139be427e2cdd0401a2c4b8e6279ee9305c5507fbd73c5bc0df65d'
            '105c55cc9449b999e9ce1542dc50e88d314b9e71e58ffaa3376fbd641a18b7975196420bf8a4ced51e56e9299a9551868ec6942129efe0333e758cabd5c5b468')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable husky command
	sed -i '/husky install/d' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' {'configs','packages'}'/'*'/package.json'

	# Force the newest version of electron-to-chromium
	sed -E -i 's|(.*)("electron": ")|\1"electron-to-chromium": "'"$(npm view 'electron-to-chromium@latest' version)"'",\n\1\2|' 'packages/compass/package.json'

	# Use a fork of os-dns-native (as there are issues with the path not being in the main node_modules directory, a local copy is not used)
	sed -E -i "s|(.*)\"os-dns-native\": \".*\",|\1\"os-dns-native\": \"dpeukert/os-dns-native\",|" 'packages/'{'compass','connection-model'}'/package.json'
	patch --forward -p1 < "$srcdir/hadron-build-os-dns-native.diff"

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Run the first part of npm run bootstrap
	npm install

	# Run the second part of npm run bootstrap
	NODE_OPTIONS='--openssl-legacy-provider' npx lerna run bootstrap --stream
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	HADRON_DISTRIBUTION="${_target%-beta}" HADRON_SKIP_INSTALLER='true' NODE_OPTIONS='--openssl-legacy-provider' npm run package-compass
}

package() {
	local _distFolder="$srcdir/$_sourcedirectory/packages/compass/dist/MongoDB Compass$_edition-linux"
	case "$CARCH" in
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
NODE_ENV=production exec $_electronpkg '/usr/lib/$pkgname/app.asar' "\$@"
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

	install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
