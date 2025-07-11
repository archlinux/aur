# Maintainer: Daniel Peukert <daniel@peukert.cc>
_target='compass'
_edition=''
pkgname="mongodb-$_target"
_pkgver='1.46.5'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
_electronpkg='electron36'
depends=("$_electronpkg" 'krb5' 'libmongocrypt>=1.12.0' 'libsecret' 'lsb-release' 'nodejs>=18.19.1')
makedepends=('git' 'npm>=11.4.1' 'python' 'unzip')
optdepends=('org.freedesktop.secrets')
backup=('etc/mongodb-compass.conf')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mongodb-js/compass/archive/v$_pkgver.tar.gz"
	'update-dependencies.diff'
	'update-dependencies-beta.diff'
	'hadron-build-ffmpeg.diff'
	'fix-argv.diff'
	'fix-argv-beta.diff'
	'mongodb-compass.conf'
)
b2sums=('27a836be849477aa823a6c133c12ac60772c2786c8bc67136133a4842393e59ba588b7c271cd9874d29d41ce1b52e4f3e6d9fba9ba6b44f78fe5f64d4ef123e4'
        '39963c3cf3aec9a9e43ea76a5a5d7ac7dfd5bc9ed3011bbf8b1febf4f70fc5b885e33197327d9ac82f3ae51d282e118f206ac1ee44dfbff7192109ecf05e9e8e'
        'ba5a5b57c4f8d75fa2cbdbf9267a4025768db5c9c13759893b29e1a4265e16ea4a5194e880b6e70d30db19e0e25ff248a06de8152936c9f36d277654ca7ac14d'
        '339cb2f14805ce8f186064d823b3b01630ea02b16052fb764a46a4df2c9b06f8d12b012e764d00aaa1906639e8019869816ddbb6c02fedac2cb06caeefab28ef'
        '69154b5491c8c3149195743bcbcb0ae7b18b8e83635f7afa29e9ef7b50a42343a2877760b41662c5943b8f7d390df85548cbcd253772fa92e33b9f231ab19436'
        '416e82d97116bbb4c8ad00837a81608a3b18fba4fffa9adebbabc4583124da96f9c6632645de5a9b234ccdb0436030928546c8c1a897081da8bbd12fef95249e'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

_sourcedirectory="compass-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Set npm overrides for various dependencies
	if [[ "$_target" =~ -beta$ ]]; then
		patch --forward -p1 < "$srcdir/update-dependencies-beta.diff"
	else
		patch --forward -p1 < "$srcdir/update-dependencies.diff"
	fi

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'
	npm update electron --package-lock-only

	# Force the newest version of electron-to-chromium to make sure we support the Electron version set above
	npm update electron-to-chromium --package-lock-only

	# Fix ssh2 and cpu-features build
	npm update nan ssh2 --package-lock-only

	# Don't use the bundled ffmpeg
	patch --forward -p1 < "$srcdir/hadron-build-ffmpeg.diff"

	# Apply argv fixes
	if [[ "$_target" =~ -beta$ ]]; then
		patch --forward -p1 < "$srcdir/fix-argv-beta.diff"
	else
		patch --forward -p1 < "$srcdir/fix-argv.diff"
	fi

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
