# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='6.1.2'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only AND LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron39'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'npm' 'python' 'yarn')
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
b2sums=('b84d274b2b8b735c674fb14ebfc1e228d53cd050b3b2a0ebe2905eebe6363a6e2725991a66f7d8d8c42ac67f566d4c2cadf3eeaea2838ae4dbe811f8a8f616cc'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'f1bf1c74529bb101e95eec346ffef46f842e208bb7272e487bf4d5ba340b8f9af9b8af1e2f79423db034f296cc01d28cd86c91e908a374de4f48c3766a68db2f'
        '178e3b0574aba79cc35f1cf972f6e20a21d260c242c3230040f20dd6b804b41966620494930f7646478298a729767e30eb632fd60075509144f2270a7ed3233f'
        '7a2b1b855e7666afbd1f23e5a041a1534e59790aca5408861009480364ec00c4040e3da737b5648e10977ead35918a9b9950b8e3c96bdc0f00310932fc8136a3'
        '6a1e94f61e571fc80389562950c392f320a594ac980311af0f17fe288a9cc4387caae851332ca4eb2eae1499f297404613b8a2dbfc6ef3861eebc09be5fde173'
        '70ee7097b8f31000503b2141c6adfc45a033472c5fcb68eaa68a761aedf295eb45da3f71c86a1eb57f3c57267f736c031e58088bfd7a494693a3434eded2b4c0')

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

	# Set yarn overrides for various dependencies to be compatible with current node and Linux versions
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

	# Set system Electron version for ABI compatibility
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Install dependencies
	HUSKY=0 yarn install
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	yarn run electron:build
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run unit tests (yarn run test:unit currently calls a non-existent command)
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn workspace beekeeper-studio run test:unit --ci
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn workspace @beekeeperstudio/ui-kit run test

	# Run non-DB integration tests
	ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electronpkg" yarn workspace beekeeper-studio run test:ci --ci
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
