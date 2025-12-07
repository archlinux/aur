# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass'
_edition=''
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='r19381.ge0b515baf'
pkgrel='1'
epoch='1'
pkgdesc='The official GUI for MongoDB - git version'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron37'
depends=("$_electronpkg" 'krb5' 'libmongocrypt>=1.12.0' 'libsecret' 'lsb-release' 'nodejs>=20.16.0')
makedepends=('git' 'npm>=11.4.1' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname::git+https://github.com/mongodb-js/compass"
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'update-dependencies.diff'
	'mongodb-compass.conf'
)
b2sums=('SKIP'
        'c0f139a686be88867b54ee530bd95bf51e71ccf2d07f25a8a70fffdfc7592ff017fd386641170a80596f855b2df39da5dc05fc563c018540fc3bc610e16971e1'
        '925dbea3aa18e5ac3529276f0c5d4c42d7ae5cb81cc9e5df3b411af751b8314e9a20bd0c5c7af144d2cdd11a26634a11aa7c064545d96003566640f5005375df'
        '66067db3cd9a69d9d5cf8fc7e1f0907e92a43569ff5d1aeab7e466bba8bb749e0e9e4e2ff07634c64a4b411f860d12db580507b9c0d6ba55f18bb7e6d166c212'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Set npm overrides for various dependencies
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Update overriden packages, see below for reasoning
	## electron - ABI compatibility with the system Electron version
	## electron-to-chromium - ensure compatibility with the Electron version set above
	## nan - fix build with current node/kernel version
	## ssh2 - fix build with current node/kernel version
	## html-webpack-plugin - fix build with node>=25.1.0
	npm update electron electron-to-chromium nan ssh2 html-webpack-plugin --package-lock-only

	# Run the bootstrap command
	HUSKY=0 GYP_DEFINES='libmongocrypt_link_type=dynamic' npm run bootstrap
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	local _version
	_version="0.0.$(git rev-list --count HEAD)-dev.0"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187
	HADRON_DISTRIBUTION="$_target" HADRON_SKIP_INSTALLER='true' DEV_VERSION_IDENTIFIER="$_version" npm run package-compass
}

package() {
	local _distFolder
	_distFolder="$srcdir/$_sourcedirectory/packages/compass/dist/MongoDB Compass$_edition Dev-linux"

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

	install -Dm644 'resources/app.asar' "$pkgdir/usr/lib/$_pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'resources/app.asar.unpacked/' "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
NODE_ENV=production exec $_electronpkg '/usr/lib/$_pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$_pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=MongoDB Compass$_edition
Comment=The official GUI for MongoDB
Exec=$_pkgname %U
Icon=$_pkgname
Type=Application
StartupNotify=true
Categories=Office;Database;Building;Debugger;IDE;GUIDesigner;Profiling;
EOF

	install -Dm644 "$srcdir/mongodb-compass.conf" "$pkgdir/etc/mongodb-compass.conf"

	install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass-logo-dev.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
