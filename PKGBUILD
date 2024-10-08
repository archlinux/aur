# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass'
_edition=''
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='r17608.g2c24180a7'
pkgrel='1'
epoch='1'
pkgdesc='The official GUI for MongoDB - git version'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron30'
depends=("$_electronpkg" 'krb5' 'libmongocrypt' 'libsecret' 'lsb-release' 'nodejs>=20.16.0')
makedepends=('git' 'npm>=10.2.4' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname::git+https://github.com/mongodb-js/compass"
	'update-dependencies.diff'
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'mongodb-compass.conf'
)
b2sums=('SKIP'
        '3347d8004a45449e748c34b4113a2f304505780cf52ec36d38d535d9656587ebc55b2d7a9e48b6ad237e32b6c1f8010d87227b45e878777895bb824b5a2c36c4'
        '1b58f95bece4036c96ff6424aaa8a0469d1a45dae1a2bff391d08ef2799bf83810f7d13d1a8c81a5d7abd1c19c4d78bf27b5af4c5b1356947c54d724cc3a92fc'
        '2a07533bbd4697e8ad0e29402867662cc9d817dfbcfcde8bfa2e4e06f8df3c7d036822b8b33b49cb1d29a8b2c126c5a3381c6b2283e2732e4ca2943bd06bed68'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable husky command
	sed -i '/husky install/d' 'package.json'

	# Set npm overrides for various dependencies
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'
	npm update electron --package-lock-only

	# Force the newest version of electron-to-chromium to make sure we support the Electron version set above
	npm update electron-to-chromium --package-lock-only

	# Fix build of ssh2
	npm update ssh2 --package-lock-only

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Run the bootstrap command
	npm run bootstrap
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
