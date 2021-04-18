# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-isolated'
_edition=' Isolated Edition'
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='r3431.g0bd73bae'
pkgrel='1'
epoch='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
depends=('electron6' 'krb5' 'libsecret' 'lsb-release')
makedepends=('git' 'npm6' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/mongodb-js/compass"
	'hadron-build.diff'
)
sha256sums=('SKIP'
            '559564c32e2b499d09b9c5b3badcaf64c88d89786d4542bb11bb36a26b5ca657')

_sourcedirectory="$pkgname"
_homedirectory="$pkgname-home"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace version in package.json
	_compassversion="99.99.$(git rev-list --count HEAD)"
	sed -E -i 's|"version": ".*",|"version": "'"$_compassversion"'",|' 'package.json'

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node -v | sed 's/^v//')"'"|' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron6/version')"'"|' 'package.json'

	# Prepare dependencies
	HOME="$srcdir/$_homedirectory" npm install

	# Apply hadron-build fixes
	patch -d 'node_modules/hadron-build/' --forward -p1 < '../hadron-build.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	NODE_ENV='production' HOME="$srcdir/$_homedirectory" npm run release-evergreen "$_target"
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
