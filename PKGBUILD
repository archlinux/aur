# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.0.6'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only' 'LicenseRef-BeekeeperStudioApplicationEULA')
_electronpkg='electron31'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'python' 'yarn')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
	'LICENSE.md'
)
b2sums=('8491026a610572dd066d35d4ac542ba337b7217f7949d9b9439a9d9f0580eeee3242f71de362fa5d5026d29b018fd5432b56b4069865d5fa43675bea20234e03'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'af66e7a1052a4b8d6bbe2a87462094804ad3ee51bbd38ebc5a1e06c6e5580ec4f3adb138b82d2db96bf265d9f4d12bbd2a46954fe7e5bded706915e77bb5b8ee'
        '4be3b51d6e091519b8dd540a8eb71c73fbda1bd46e01a98049aae3e8685b73d55111acdaecce041e7a9645799645fdd490feab9dd9c5e4897f734b78094eec46'
        'b5f0a224b71c8ec5966333cc24bdd59a58728175448e88a4779e100823b76f25088a934775ba5eb2c13d110e4f5889d11d2a0c3ee3b965489f644561659dd176')

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
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e "s/%%FLAGFILENAME%%/bks/g" "$srcdir/electron-launcher.sh"

	# Update dependencies to be compatible with current node and Linux version
	sed -E -i 's|("resolutions": \{)|\1\n"better-sqlite3": "11.7.0"|' 'package.json'
	sed -E -i 's|("resolutions": \{)|\1\n"sqlite3": "5.1.7",|' 'package.json'

	# Install dependencies
	yarn install --ignore-engines
}

build() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	yarn run electron:build
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
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/app.asar.unpacked/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"

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
