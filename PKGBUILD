# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='4.6.8'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only')
_electronpkg='electron18'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
)
b2sums=('341b09c2d9a0d1a95a558ea946c189be495d6184ebe94d8001911fff53db46046cfb8a8cc336261e62990a2836b96fbe92470d0bfa077bef8f6753d974e68822'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        '4af548291a1e76b0f61eee042621c492b0324eab91b5885feab165b7c6b3613a6e438fabbebce2246a51c2c6411881f3f93806a2c9b28113a95d6fd94eb6d17c'
        '160220f17f5e6ae1ceed499587bb9e6d07d8b34934cdc6c12931c41c7cf5a9b255e569f47e49073351b96b43bfbdb0a4387f4dfadbeb341547e4cde302e81e51')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Apply patches
	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	# Replace Electron location and version in build config
	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/vue.config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/vue.config.js'

	# Replace package name, flag file name and Electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e "s/%%FLAGFILENAME%%/bks/g" "$srcdir/electron-launcher.sh"

	# Update dependencies to be compatible with current node and Linux version
	sed -E -i 's|("resolutions": \{)|\1\n"sass-loader": "10.5.2",|' 'package.json'
	sed -E -i 's|("resolutions": \{)|\1\n"better-sqlite3": "11.1.2",|' 'package.json'
	sed -E -i 's|("resolutions": \{)|\1\n"sqlite3": "5.1.6",|' 'package.json'
	sed -E -i 's|("resolutions": \{)|\1\n"node-gyp": "10.2.0",|' 'package.json'

	# Install dependencies
	NODE_OPTIONS='--openssl-legacy-provider' yarn install --ignore-engines
}

build() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	NODE_OPTIONS='--openssl-legacy-provider' yarn run vue-cli-service electron:build
}

check() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"

	# Run unit tests
	yarn run test:unit --ci

	# Run non-DB integration tests
	yarn run test:ci --ci

	# Not running DB intergration tests, as they are currently not repeatable and the sqlserver test suite does not work
	# yarn run test:integration --runInBand --ci --testPathIgnorePatterns=sqlserver.spec.js
}

package() {
	# Electron resources
	cd "$srcdir/$_sourcedirectory/apps/studio/dist_electron/"
	install -Dm644 'linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
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

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
