# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.7.3'
pkgrel='2'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only AND LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron39'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'python' 'yarn')
provides=("$pkgname-ultimate=$pkgver")
conflicts=("$pkgname-ultimate")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
	'disable-update-checking.diff'
	'update-dependencies.diff'
	'missing-log-app-name.diff'
	'LICENSE.md'
)
b2sums=('102348512aa50ef0c42fc6df81dbe86cd85a776c2f1ee9d350560b63212a0d2387eea4f3cb110ebf0fde0ae7fb6600ad51e411fce49eecb9cf178a90395dcdf1'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'e27ce86d8c00f4809b51fcc580818acaddd6c5c753acbebfdfb69b270cf001ec7ec89d2e59a5dbfdbaf985b6ea4d0fbb95fc2c7ea76e130d0db00d6ec951ba51'
        'c0a054bddc89f05c97ab7637b3fc9d3c787bf34db332e0b07d27d872af25677d5eb01382242e36f7884f09428bf2520bb78e951ebf321280097a55f7e3bd3f73'
        'e301ba915d5642c55d082352c7e827a732bc27e851280c7b5044b70f899d21861c737042923ae61b6f1995a59259cd69dcf269a3d54df4d8196db02cdaad03a2'
        'f5cf6e9fb90e8e9aaf52988c43fd4b472981721178584467d6a84608248e48862dff9cdbdef92aab764a9b1a34f4e3f6b6a5f901b2ff0569126b75ba066081e5'
        '36e0dab7e6e489a19cb6709a39a0f38f2f9a34200c7af297b94b8aa5e24ecdc3ec9451a0791d79ba72b7c51ad156d9abdb2b52deee7c3b3da3a5faa637480ebc'
        'e3c500691772f577a9f96b7672ba2f823eae58b9a22bd92bc1d9d0da73620d92a9c503b5d8850b59c6e8bf7126dfb0c23e6e2a738fb10865fc85a4a2a572fbdd')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Apply patches
	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"
	patch --forward -p1 < "$srcdir/disable-update-checking.diff"

	# Replace Electron location and version in build config
	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/electron-builder-config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/electron-builder-config.js'

	# Replace package name, flag file name and Electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e 's/%%FLAGFILENAME%%/bks/g' "$srcdir/electron-launcher.sh"

	# Set npm overrides for various dependencies to be compatible with current node and Linux versions
	# (see https://github.com/beekeeper-studio/node-sqlanywhere/pull/3 for node-sqlanywhere fix)
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Install dependencies
	HUSKY=0 yarn install

	# Apply electron-log patch
	cd "$srcdir/$_sourcedirectory/node_modules/electron-log/"
	patch --forward -p1 < "$srcdir/missing-log-app-name.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	yarn run bks:build
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run unit tests (yarn run test:unit currently calls a non-existent command)
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn workspace beekeeper-studio test:unit --ci
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn workspace @beekeeperstudio/ui-kit test

	# Run non-DB integration tests
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn run test:ci --ci
}

package() {
	cd "$srcdir/$_sourcedirectory/apps/studio/dist_electron/"

	# Binary
	install -Dm755 "$srcdir/electron-launcher.sh" "$pkgdir/usr/bin/$pkgname"

	# Modify AppArmor profile and move it to the correct location
	sed "s|\"/opt/Beekeeper Studio/$pkgname\"|Exec=\"/usr/bin/$pkgname\"|" -i 'linux-unpacked/resources/apparmor-profile'
	install -dm755 "$pkgdir/etc/apparmor.d/"
	install -Dm644 'linux-unpacked/resources/apparmor-profile' "$pkgdir/etc/apparmor.d/usr.bin.beekeeper-studio"
	rm -f 'linux-unpacked/resources/apparmor-profile'

	# Copy various resources (runtime dependencies, configs, demo files, etc.)
	rm -f 'linux-unpacked/resources/app-update.yml'
	rm -f 'linux-unpacked/resources/package-type'
	rm -f 'linux-unpacked/resources/bundled_plugins/'*'/'*'/dist/assets/'*'.map'
	install -dm755 "$pkgdir/usr/lib/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/' "$pkgdir/usr/lib/$pkgname/"

	# Extract pacman archive and copy support files (desktop, icons, mime)
	mkdir -p "$srcdir/$pkgname-$pkgver-pacman/"
	tar -xf "$pkgname-$pkgver.pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cp -r --no-preserve=ownership --preserve=mode "$srcdir/$pkgname-$pkgver-pacman/usr/share/" "$pkgdir/usr/share/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	# Copy commercial license
	install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/BeekeeperStudioApplicationEULA"
}
