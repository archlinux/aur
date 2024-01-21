# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-readonly'
_edition=' Readonly'
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='r16716.gfd2aab99c'
pkgrel='1'
epoch='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition - git version'
# If you're running on armv7h or aarch64, use the electron25-bin package from the AUR for the electron25 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron25-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron28'
depends=("$_electronpkg" 'krb5' 'libsecret' 'lsb-release' 'nodejs>=16.15.1')
makedepends=('git' 'npm>=8.19.4' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/mongodb-js/compass"
	'hadron-build-ffmpeg.diff'
	'hadron-build-os-dns-native.diff'
	'fix-argv.diff'
)
sha512sums=('SKIP'
            '6338626b9c957c79cd761f19a3d17d856ff88ce96d38c5507269b8dbaf3f20bef00012d035e5e1bde6493db495e2cfce172bcd021a5a8ae1c37dcb5f7a46a875'
            '084dfe4feae0ac1997a141ac92294b4d132301bd493162abfe0a5acdff2f997928e5b24f21c27bcbce6c74b6b1d1014738d43a387074d7a3b5296279bbb15f6c'
            '375142120fd97a3fd9e24d19c864ee3b24e50a5e6b0b224b7ce74742dc5bde185056a9b6f1add63d5ce66e3f0a9309e03873096540e5697547d60a2bc9e769ae')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable husky command
	sed -i '/husky install/d' 'package.json'

	# Working around https://gitlab.archlinux.org/archlinux/packaging/packages/electron28/-/issues/1
	_installedelectronver="$(cat "/usr/lib/$_electronpkg/version")"

	if [ "$_installedelectronver" = '28.1.5' ]; then
		_installedelectronver='28.1.4'
	fi

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$_installedelectronver"'"|' {'configs','packages'}'/'*'/package.json'

	# Force the newest version of electron-to-chromium
	sed -E -i 's|(.*)("electron": ")|\1"electron-to-chromium": "'"$(npm view 'electron-to-chromium@latest' version)"'",\n\1\2|' 'packages/compass/package.json'

	# Use a new version of os-dns-native
	sed -E -i "s|(.*)\"os-dns-native\": \".*\",|\1\"os-dns-native\": \"1\.2\.1\",|" 'packages/compass/package.json'
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

	HADRON_DISTRIBUTION="$_target" HADRON_SKIP_INSTALLER='true' NODE_OPTIONS='--openssl-legacy-provider' npm run package-compass
}

package() {
	local _distFolder="$srcdir/$_sourcedirectory/packages/compass/dist/MongoDB Compass$_edition Dev-linux"
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

	install -Dm644 "$srcdir/$_sourcedirectory/packages/compass/app-icons/linux/mongodb-compass.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	install -Dm644 'LICENSES.chromium.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
