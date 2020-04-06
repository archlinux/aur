# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_target='compass-isolated'
_edition=' Isolated Edition'
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='1.22.0.r3260.86f2aeb0'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Isolated Edition - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('electron6' 'krb5' 'libsecret' 'lsb-release')
makedepends=('git' 'npm' 'python' 'unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/mongodb-js/compass"
	'hadron-build-packaging.diff'
)
sha256sums=('SKIP'
            '87ec3245af05788c1c0d7070fcd4e425a0a22dbf7a4ae194a5dce8ade88d519a')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace version in package.json
	_origversion="$(sed -nE 's|.*"version": "(.*)".*|\1|p' 'package.json')"
	_compassversion="$(echo "$_origversion" | cut -d '.' -f 1-2).$(git rev-list --count HEAD)"
	_aurversion="$(echo "$_origversion" | cut -d '-' -f 1).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	sed -E -i 's|"version": ".*",|"version": "'"$_compassversion"'",\n"_aurversion": "'"$_aurversion"'",|' 'package.json'

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node -v | sed 's/^v//')"'"|' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron6/version')"'"|' 'package.json'

	# Prepare dependencies
	export HOME="$srcdir/$pkgname-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
	export npm_config_devdir="$srcdir/$pkgname-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-npm-cache"

	npm install

	# Disable hadron-build packaging
	patch -d 'node_modules/hadron-build/' --forward -p1 < '../hadron-build-packaging.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	sed -nE 's|.*"_aurversion": "(.*)".*|\1|p' 'package.json'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	export NODE_ENV='production'
	export HOME="$srcdir/$pkgname-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
	export npm_config_devdir="$srcdir/$pkgname-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-npm-cache"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	npm run release "$_target"
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

	install -Dm644 'resources/app.asar' "$pkgdir/usr/lib/$_pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'resources/app.asar.unpacked/' "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
NODE_ENV=production exec electron6 '/usr/lib/$_pkgname/app.asar' "\$@"
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

	install -Dm644 "$srcdir/$_sourcedirectory/src/app/images/linux/mongodb-compass.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
