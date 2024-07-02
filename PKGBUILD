# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-beta'
_edition=' Beta'
pkgname="mongodb-$_target"
_pkgver='1.43.4-beta.1'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version'
# If you're running on armv7h or aarch64, use the electron29-bin package from the AUR for the electron29 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron29-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron29'
depends=("$_electronpkg" 'krb5' 'libsecret' 'lsb-release' 'nodejs>=16.15.1')
makedepends=('git' 'npm>=8.19.4' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'mongodb-compass.conf'
)
b2sums=('a43415434a19eeea54aaea1e40387c059c7bd9bb071ac0720e3ea85214845927c5b753cc3ce0e5a81ed7b4725c6d20c73c40cb8838fbacefc724aa3bc4449dac'
        '58f8f765318090e2a4b0de8ab77a3c4034cd652ab1a84fdf72d7582b6e9bdd5b1c2f209ea1c27720c2d67ff471d56756ab91e4b62efb7975b7197c4bdb04d34b'
        'dfb2723ebea5a6f12d8a5dade5a98abb3645ad62f74c43dc05c7178b5257526a69c4a0353782c399a790d6d9c4d8438b0041863e8dbdf638f25bdf3fffbbb42f'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable husky command
	sed -i '/husky install/d' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' {'configs','packages'}'/'*'/package.json'

	# Force the newest version of electron-to-chromium
	sed -E -i 's|(.*)("electron": ")|\1"electron-to-chromium": "'"$(npm view 'electron-to-chromium@latest' version)"'",\n\1\2|' 'packages/compass/package.json'

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

	install -Dm644 "$srcdir/mongodb-compass.conf" "$pkgdir/etc/mongodb-compass.conf"

	if [[ "$_target" =~ -beta$ ]]; then
		install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass-logo-beta.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	else
		install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass-logo-stable.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	fi

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
