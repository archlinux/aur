# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='4.3.0'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
# If you're running on pentium4, you have to add it to the arch and source arrays of the electron18-bin AUR dependency
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only')
_electronpkg='electron18'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs-lts-iron' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'electron-builder-config.diff'
	'fix-argv.diff'
)
sha512sums=('3e1594aee2ace4b3b2ffbe9c428c1d35978d40c366d8c0452fa24b972be0d5df68dea1f882aa06b31e8ab6aa4c5bbcf7b385f666abf630f9b1e8a57c26496093'
            'e6b9a9ac3c62cc2b040c4ece48ab27a29e1ba8fbf2c3d45f299aeb7c2b0a967acb8e84171f5d71f63ebedba52a8f376beab40e8889bda668341aa1d9da50bd47'
            '942fb32dd31bc2b45422d6caf17a920706eae4997873aad3cc1e0f721219cd2193490f8be0e108418eef24b546513595283d8cec2e75ee2192e66f49fbc5e161'
            'ef966f4cc3358d76f3d5215881ffba6385d954ec1709e5b5708fff1c7544f84c45d4e7e31f63fe385d4bd87084deafa227e5fa6430019940bc5acc6d88e1e2c0')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/vue.config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/vue.config.js'

	# Replace package name, flag file name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e "s/%%FLAGFILENAME%%/bks/g" "$srcdir/electron-launcher.sh"

	# Update sass-loader to be compatible with current node and Linux version
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	yarn add 'sass-loader@10.5.2' --ignore-engines

	# Install dependencies
	cd "$srcdir/$_sourcedirectory/"
	yarn install --ignore-engines
}

build() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	# The build gets stuck in an infinite loop if debug output is not enabled
	DEBUG='*' NODE_OPTIONS='--openssl-legacy-provider' yarn run vue-cli-service electron:build
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
