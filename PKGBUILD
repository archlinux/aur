# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.9.1'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only AND LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron39'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'python' 'yarn')
optdepends=(
	'aws-cli-v2: AWS CLI Authentication support for Amazon Redshift'
	'azure-cli: Azure CLI Authentication support for MySQL, PostgreSQL and SQL Server'
	'krb5: Kerberos / Windows (via ODBC) support for SQL Server'
	'libaio: Thick Mode support for Oracle'
	'msodbcsql: Kerberos / Windows (via ODBC) support for SQL Server'
	'oracle-instantclient-basic: Thick Mode support for Oracle'
	'unixodbc: Kerberos / Windows (via ODBC) support for SQL Server'
)
provides=("$pkgname-ultimate=$pkgver")
conflicts=("$pkgname-ultimate")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
	'disable-update-checking.diff'
	'update-dependencies.diff'
	'LICENSE.md'
)
b2sums=('d65eed2bf6569baacb5940c7782f34214039c4575f86f5e187be7946f5b7b5f225245a5d7ee345be90c12107410b65cd3f469cc75922273c54f5797d3f2b77d2'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        '70d93e8fc4c61e43737fd7177480f1aa2eb5fa1aa1b2ed2882384e51d1060eb511454dc06cd7b8b3e60326270a3739b31107dea8abc5668051b4a8a0ac3f1031'
        'ec02f85fc2b7f47e45a0ebd3c39c111606c90e8e4296247b9c1c0d5c354c2640696d9c1a230dfb707b959e2e2b6aa544c8e29eef953a7889d1a23796ff6bd196'
        '21fdbaab298acb62e2676137e6bdea3dadb3a400ffa388451434e39c18e1f422b7d03fc182aebd1dbcda68f57535c8e6f941c95e8dd9865502b6088552c98c51'
        '796b95769c3e1d60b5ae561ad4e2a3874a4940dd058fae325505c15fe290e42165fff7c9aee9ff42853474552dbe7a290c1e2881648cb7c852bc39221d79c1a9'
        '360dd26e3fd4ed4801ca863325b1eeac0a026b9915f64a0260a146d5a8d125ba9a4342aa4b1afbc502509c74c4926f65d0ac0d6d1e2b5d399546e7cdc13c60fa')

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
