# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass-beta'
_edition=' Beta'
pkgname="mongodb-$_target"
_pkgver='1.46.1-beta.1'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron32'
depends=("$_electronpkg" 'krb5' 'libmongocrypt>=1.12.0' 'libsecret' 'lsb-release' 'nodejs>=18.19.1')
makedepends=('git' 'npm>=10.2.4' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'update-dependencies.diff'
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'mongodb-compass.conf'
)
b2sums=('8ca1b1746599007dd7c4d69bc6a1ec7a2eed94aec5670e2629b0e91082c926994d53a4dbcb12505742afa2f23fdc260777bc6cd3cc51d873494604291a8bf594'
        'f4b3d86ede6f787a7adf3762911f8e74bf0ff658c906092a764d8080248c1a32cc8d2e536d14a19d7ced3374b267bc6b82f1a6d639ba623db21a5f2ea35af5b0'
        '408f302c55df5d6c2fdba66d0b0666081780d625b34d1ca81b85061a2ae2ffbdc1a136a9199b76ee18a7f52ff6832db27d4a16796226ab8543b4621fc6827ade'
        '69154b5491c8c3149195743bcbcb0ae7b18b8e83635f7afa29e9ef7b50a42343a2877760b41662c5943b8f7d390df85548cbcd253772fa92e33b9f231ab19436'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="compass-$_pkgver"

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
	GYP_DEFINES='libmongocrypt_link_type=dynamic' npm run bootstrap
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
