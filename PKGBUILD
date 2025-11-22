# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='5.4.12'
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
	'disable-update-checking.diff'
	'update-dependencies.diff'
	'missing-log-app-name.diff'
	'LICENSE.md'
)
b2sums=('06a2f74d56861c764e813f884eeee85cb96e1679f72fa1f94a56fb5f6f91d1ae7b8f7a5d451a26297b8c882e93cd9342c3f9838101617056e20bf0aa54768330'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'd48563db28f1b60f28dceaeb6a4e3864808a394b1ac9a37b1ee7a7efa09c6b271d157fc5fe9b11a1c7df309b714245607666dc568ffe3dd21e61e077a3bcd674'
        'd6c254a87121792caed6be8619aa51d2dc362342e31bc4268d37cfb72d4e827ad3191b88c3cac25bd7edec7ef47db168dbf1e3b27176efa07d8db4c04a537a76'
        '258e8f585fc7f96f4964e9bddd79d7450b028611d63850934361d99e25a37eddcbf7effe3479826f1e508ae4b524870bc2a10b884c8e7bfeb6e298e30e555837'
        'c6e79c184920f1b04f49050eaedb4d1797131b9dcea26427f8b2608e4b2c08ce97a731b725159392a4b165e29bb48ca91195e5f2cb8bf17741d8478db9637ed5'
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
	patch --forward -p1 < "$srcdir/update-dependencies.diff"

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

	# Copy various resources (runtime dependencies, configs, demo files, etc.)
	install -dm755 "$pkgdir/usr/lib/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/' "$pkgdir/usr/lib/$pkgname/"
	rm -f "$pkgdir/usr/lib/$pkgname/app-update.yml"

	# Extract pacman archive and copy support files (desktop, icons, mime)
	mkdir -p "$srcdir/$pkgname-$pkgver-pacman/"
	tar -xf "$pkgname-$pkgver.pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cp -r --no-preserve=ownership --preserve=mode "$srcdir/$pkgname-$pkgver-pacman/usr/share/" "$pkgdir/usr/share/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
	
	# Copy commercial license
	install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/BeekeeperStudioApplicationEULA"
}
