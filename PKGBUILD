# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.2.12'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only AND LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron31'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'python' 'yarn')
provides=("$pkgname-ultimate=$pkgver")
conflicts=("$pkgname-ultimate")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
	'missing-log-app-name.diff'
	'LICENSE.md'
)
b2sums=('0ad12a6b725c548cc9398831f8ccd32ae87b81980f8ac39932fe6f9d0a91c2c290f15c4ce189a266aed9cc7364e68ba2f0e56f69462e2480eee0fa3193ed4f49'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'e1642a5e2ec927922ef5eb73a9987779587846de2e175100cfe5dd2d7c8a96bd4d8baa2dca2c67f323ae1d764de747f9c6cebaa5944b3896e2c4d6a2a1ee311a'
        '710d9cc5dc5c435aabcf4cd0d64fac238ed5a301a6e8797bc9d0d6ef58a0908bc551ff1bcde0e4cbaabdd3a175d66a0231b06d553c225262bd3cefedd95bc70f'
        '36e0dab7e6e489a19cb6709a39a0f38f2f9a34200c7af297b94b8aa5e24ecdc3ec9451a0791d79ba72b7c51ad156d9abdb2b52deee7c3b3da3a5faa637480ebc'
        '055ca4386f171af5916e7377605b57b23fc4de6fda4c57a0ae86782a18baeabde874f06a5cc2521a8bed65d30fb0b17c5a3edd005ffc2daddea6b785d09ea737')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Apply patches
	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Replace Electron location and version in build config
	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/electron-builder-config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/electron-builder-config.js'

	# Replace package name, flag file name and Electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e 's/%%FLAGFILENAME%%/bks/g' "$srcdir/electron-launcher.sh"

	# Update better-sqlite3 and kerberos dependencies to be compatible with current node and Linux versions
	sed -E -i 's|("packageManager".*)|\1,\n  "resolutions": \{\n    "better-sqlite3": "11.2.0"\n,\n    "kerberos": "2.1.1"\n  }|' 'package.json'

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

	# Run unit tests
	yarn run test:unit --ci

	# Run non-DB integration tests
	yarn run test:ci --ci

	# Not running DB integration tests, as they are currently not repeatable and the sqlserver test suite does not work
	# yarn run test:integration --runInBand --ci --testPathIgnorePatterns=sqlserver.spec.js
}

package() {
	# Electron resources
	cd "$srcdir/$_sourcedirectory/apps/studio/dist_electron/"
	install -Dm644 'linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	install -Dm644 'linux-unpacked/resources/demo.db' "$pkgdir/usr/lib/$pkgname/demo.db"
	install -Dm644 'linux-unpacked/resources/production_pub.pem' "$pkgdir/usr/lib/$pkgname/production_pub.pem"
	install -Dm644 'linux-unpacked/resources/default.config.ini' "$pkgdir/usr/lib/$pkgname/default.config.ini"
	install -Dm644 'linux-unpacked/resources/system.config.ini' "$pkgdir/usr/lib/$pkgname/system.config.ini"
	install -Dm644 'linux-unpacked/resources/user.config.ini' "$pkgdir/usr/lib/$pkgname/user.config.ini"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/app.asar.unpacked/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/public/' "$pkgdir/usr/lib/$pkgname/public/"

	# Binary
	install -Dm755 "$srcdir/electron-launcher.sh" "$pkgdir/usr/bin/$pkgname"

	# Extract pacman archive and copy files
	mkdir -p "$srcdir/$pkgname-$pkgver-pacman/"
	tar -xf "$pkgname-$pkgver.pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cd "$srcdir/$pkgname-$pkgver-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	# Copy commercial license
	install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/BeekeeperStudioApplicationEULA"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
