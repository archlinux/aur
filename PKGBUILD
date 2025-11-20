# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-isolated'
_edition=' Isolated Edition'
pkgname="mongodb-$_target"
_pkgver='1.48.2'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Isolated Edition'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron37'
depends=("$_electronpkg" 'krb5' 'libmongocrypt>=1.12.0' 'libsecret' 'lsb-release' 'nodejs>=20.16.0')
makedepends=('git' 'npm>=11.4.1' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'ignore-fix-ts-errors.diff'
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'fix-local-storage.diff'
	'update-dependencies.diff'
	'mongodb-compass.conf'
)
b2sums=('9f9c2c4ef8b50cfdba40c9d4135888e728d367620dfa8df372e23aa5669874dbe1b70d68d6c2bb14a3dce12edf40c2864dec315eda251569117e61f0ec8831d0'
        'd392a97281780657529841933474b370f0ae9df9a063aa95a7c90ae43f82baacbef3840e2a3eabd0848d84dc19665cc6f7ea5a2311f1dc2eda9d03eff9be2eea'
        'c0f139a686be88867b54ee530bd95bf51e71ccf2d07f25a8a70fffdfc7592ff017fd386641170a80596f855b2df39da5dc05fc563c018540fc3bc610e16971e1'
        '925dbea3aa18e5ac3529276f0c5d4c42d7ae5cb81cc9e5df3b411af751b8314e9a20bd0c5c7af144d2cdd11a26634a11aa7c064545d96003566640f5005375df'
        '17d17d30bda15430b3a8fe15207ab41dc6820461aad52df07bf7b7a0ecc342c5605bdf57673aab24f8a136560b6cad30b059fadb2f2e271cacda6a2b903daa40'
        'a3c850d924e3f55e1319dd5c2fceb02ca07220a4a95e77847b53a2321e0268741fb0c62a712af99e10a5c50de3e5ee5af272d3465e9556510fdc46abe8edab9d'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Ignore/fix IconButton TS errors
	patch --forward -p1 < "$srcdir/ignore-fix-ts-errors.diff"

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Set npm overrides for various dependencies
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Fix broken build with node=>25.1.0 due to localStorage behavior changes (https://github.com/nodejs/node/pull/60351)
	patch --forward -p1 < "$srcdir/fix-local-storage.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Update overriden packages, see below for reasoning
	## electron - ABI compatibility with the system Electron version
	## electron-to-chromium - ensure compatibility with the Electron version set above
	## nan - fix build with current node/kernel version
	## ssh2 - fix build with current node/kernel version
	## html-webpack-plugin - fix build with node>=25.1.0
	npm update electron electron-to-chromium nan ssh2 html-webpack-plugin --package-lock-only

	# Add missing dependencies that don't get installed by default for some reason
	npm install '@aws-sdk/client-sts@3.713.0' '@aws-sdk/credential-provider-web-identity@3.713.0'

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
