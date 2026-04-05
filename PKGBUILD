# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass'
_edition=''
pkgname="mongodb-$_target"
_pkgver='1.49.4'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron37'
depends=("$_electronpkg" 'krb5' 'libmongocrypt>=1.12.0' 'libsecret' 'lsb-release' 'nodejs>=22.21.1')
makedepends=('git' 'npm>=11.4.1' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'disable-update-checks.diff'
	'update-dependencies.diff'
)
b2sums=('7b43ec35587551024b9e3898d9ad53481461c4d862b33a516ada2ac65cb010cd46cb0515ad5ab5d038d9f399127187db4eb9ccc4afe8a2dd242aaa29af16bb91'
        '56e2476e1543109bd543861b9f487f8f30399df6937f4343d108a9d0e99d457b2abc1df30def601f7c19ac611a2379e67649cf2619cea5825da5d839b00d56e1'
        '925dbea3aa18e5ac3529276f0c5d4c42d7ae5cb81cc9e5df3b411af751b8314e9a20bd0c5c7af144d2cdd11a26634a11aa7c064545d96003566640f5005375df'
        '2abf7d270582feb99bfee914928cdf9dbae18b11edd787dd906d36f43d9e6752720636b4dab82149aaf55f021acb90768e853ceaed140cd321f85b65685fcdb2'
        '27ebe4d1a0fe054aedcb3f412dfdc1ea2461308683c45599f63d4c094682baa7f7b9e1f2b447d1172ceec4fe46b0fdc2e5af8f800fe8a0a4572d3027e5ecd962')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"
	
	# Disable update checks
	patch --forward -p1 < "$srcdir/disable-update-checks.diff"

	# Set npm overrides for various dependencies
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Update overriden packages, see below for reasoning
	## electron - ABI compatibility with the system Electron version
	## electron-to-chromium - ensure compatibility with the Electron version set above
	## html-webpack-plugin - fix build with node>=25.1.0
	npm update electron electron-to-chromium html-webpack-plugin --package-lock-only

	# Run the bootstrap command
	HUSKY=0 GYP_DEFINES='libmongocrypt_link_type=dynamic' npm run bootstrap
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187
	HADRON_DISTRIBUTION="${_target%-beta}" HADRON_SKIP_INSTALLER='true' npm run package-compass
}

package() {
	local _distFolder
	_distFolder="$srcdir/$_sourcedirectory/packages/compass/dist/MongoDB Compass$_edition-linux"

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

	if [[ "$_target" =~ -beta$ ]]; then
		install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass-logo-beta.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	else
		install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass-logo-stable.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	fi

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
