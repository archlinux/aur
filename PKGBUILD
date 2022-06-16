# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-beta'
_edition=' Beta'
pkgname="mongodb-$_target"
_pkgver='1.32.3-beta.0'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
_electronpkg='electron13'
depends=("$_electronpkg" 'krb5' 'libsecret' 'lsb-release')
# We're depending on node v16 until https://github.com/nodejs/node-gyp/issues/2534 is fixed
makedepends=('git' 'nodejs-lts-gallium' 'npm>=7.0.0' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'hadron-build.diff'
	'browserslist.diff'
)
sha512sums=('a055103d9a4e9b620117a80af99477be2487af20746a998e97e495bd505441a5ddd25ce878d8c68474ae6224514b01a83d07fbc620939f052c44d00be097187a'
            '1b9bf0ba93cc979953dae1ee2b7e872ef2f8649a033aac5862f650a018b9450ac7a89a20e61718bb41203a206e2e4f193e7853539106fc2d491736645203c3fd'
            'c7ed26d911cea41cea65ede61d41c22c24296c88c4a21532d81b3092844cd65a866fe8e390570362eb7f0200a897a86e97387e8afb4e1ad8e8398c7265d529d2')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Force the newest version of electron-to-chromium
	sed -E -i 's|(.*)("electron": ")|\1"electron-to-chromium": "'"$(npm view 'electron-to-chromium@latest' version)"'",\n\1\2|' 'packages/compass/package.json'

	# Loosen node version restriction
	sed -E -i 's|"node": "\^14.|"node": ">=14.|' 'packages/compass/package.json' 'package-lock.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' {'configs','packages'}'/'*'/package.json'

	# Apply hadron-build fixes
	patch --forward -p1 < "$srcdir/hadron-build.diff"

	# Run the first part of npm run bootstrap
	npm install

	# Apply browserslist fixes
	for _folder in 'node_modules/@mongodb-js/'*'/node_modules/browserslist'; do
		if grep -q '"version": "2' "$_folder/package.json"; then
			patch -d "$_folder/" --forward -p1 < "$srcdir/browserslist.diff"
		fi
	done

	# Run the second part of npm run bootstrap
	npx lerna run bootstrap --stream
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# electron-packager does not support building against a local electron binary,
	# the best we can do for now is to just set the electron version in package.json
	# and let electron-packager use it for building
	# https://github.com/electron/electron-packager/issues/187

	HADRON_DISTRIBUTION="${_target%-beta}" npm run package-compass
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
