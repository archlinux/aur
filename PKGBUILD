# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.6.3'
pkgrel='1'
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
	'missing-log-app-name.diff'
	'LICENSE.md'
)
b2sums=('dfcc81d0a9aaf259f41e4ffcc2c81167e2f028a2dc6d43d8fa5ec25ca603adf079c1718d542bda98c56a2ed687b854088b5fc5c6098cfbd2d36e9577fc3f33b7'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        '20b600b5b223ab99ff9a0d984eeef659d88a6d85f1456c8fdbfc3c72ba646569faf29699ecaa87e800b6d13a3474698569e7faae086b31fe98f5778528b410db'
        '248cf727e04a6aced66d6b51cbecc1d4ed9472f0ba7e096ddcb0cb7160b98c3b396d74b5eadc249d1425d404ab825599335a2aaec0917706e8d317d4d0c5babd'
        'beb73ad1b69f98fd565cdafbc1fad9604f0c1994b38398960537a60f2e3c74bd5705a0e522e68627a29b25d1f7b738aa94c543928ffdbe198c61b7258103a662'
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

	# Install dependencies
	HUSKY=0 yarn install --ignore-engines

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
	yarn workspace beekeeper-studio test:unit --ci
	yarn workspace @beekeeperstudio/ui-kit test

	# Run non-DB integration tests
	yarn run test:ci --ci
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
