# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_target='compass-community-beta'
_edition=' Community Beta'
pkgname="mongodb-$_target"
_pkgver='1.21.0-beta.5'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition - beta version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('electron6' 'krb5' 'libsecret' 'lsb-release')
makedepends=('git' 'npm' 'python' 'unzip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build-packaging.diff'
)
sha256sums=('4443647232726a91725e66c52409bf0ba70d4efc05c4aeed1f3fb11ec3aa4d8b'
            '3f438dc5b2eb99a4831f83d753cb3dc86fc8b3217499310fe03469570f300ff2')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node -v | sed 's/^v//')"'"|' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron6/version')"'"|' 'package.json'

	# Prepare dependencies
	export HOME="$srcdir/$pkgname-$pkgver-$pkgrel-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-$pkgver-$pkgrel-cache"
	export npm_config_devdir="$srcdir/$pkgname-$pkgver-$pkgrel-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-$pkgver-$pkgrel-npm-cache"

	npm install

	# Disable hadron-build packaging
	patch -d 'node_modules/hadron-build/' --forward -p1 < '../hadron-build-packaging.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	export NODE_ENV='production'
	export HOME="$srcdir/$pkgname-$pkgver-$pkgrel-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-$pkgver-$pkgrel-cache"
	export npm_config_devdir="$srcdir/$pkgname-$pkgver-$pkgrel-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-$pkgver-$pkgrel-npm-cache"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	npm run release "${_target%-beta}"
}

package() {
	local _distFolder="$srcdir/$_sourcedirectory/dist/MongoDB Compass$_edition-linux"
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

	install -Dm644 "$srcdir/$_sourcedirectory/src/app/images/linux/mongodb-compass.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
