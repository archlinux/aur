# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass'
_edition=''
_pkgname="mongodb-$_target"
pkgname="$_pkgname-git"
pkgver='r16151.gccdd2ebe9'
pkgrel='1'
epoch='1'
pkgdesc='The official GUI for MongoDB - git version'
# If you're running on armv7h or aarch64, use the electron23-bin package from the AUR for the electron23 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron23-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
_electronpkg='electron23'
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
	'lerna.diff'
)
sha512sums=('SKIP'
            'ec052448ea2a375941944026b7b5419d48c67c324af5b75647376737a8f0f98f544cb335c948625c2e06f779a52c58ff2996561e1db977146faef4793d41d3e5'
            'e1082fd804ba72ccf3e53576077562f8b159b76e6aa07fa2324e31dd45c0d863d844fbb8be139be427e2cdd0401a2c4b8e6279ee9305c5507fbd73c5bc0df65d'
            '6621d214ac692f57e0802b7b4ac0c6a5aedf871896d084afb3939abe3b921ca0b4d9895d4fd0d14574e910681e6d17ecbd0ff321ed9f9a18e963d23da6778d0e'
            '2ced8f06e82a8ff5639fddb75a638bf9c1d06c8d891dd07c88dd1aa5fa00faf1d07f35f7a7d283abbac68c4ec74c750c9017c793644388c66b8027ab7acb23bd')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable husky command
	sed -i '/husky install/d' 'package.json'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' {'configs','packages'}'/'*'/package.json'

	# Force the newest version of electron-to-chromium
	sed -E -i 's|(.*)("electron": ")|\1"electron-to-chromium": "'"$(npm view 'electron-to-chromium@latest' version)"'",\n\1\2|' 'packages/compass/package.json'

	# Use a fork of os-dns-native (as there are issues with the path not being in the main node_modules directory, a local copy is not used)
	sed -E -i "s|(.*)\"os-dns-native\": \".*\",|\1\"os-dns-native\": \"dpeukert/os-dns-native\",|" 'packages/compass/package.json'
	patch --forward -p1 < "$srcdir/hadron-build-os-dns-native.diff"

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Running lerna with the new Nx task runner enabled causes the build to fail when not running in a clean chroot
	patch --forward -p1 < "$srcdir/lerna.diff"

	# Run the first part of npm run bootstrap
	npm install

	# Run the second part of npm run bootstrap
	NODE_OPTIONS='--openssl-legacy-provider' npx lerna run bootstrap --stream --load-env-files=false
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
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
