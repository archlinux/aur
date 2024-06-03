# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='4.3.4'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL-3.0-only')
_electronpkg='electron18'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs-lts-iron' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'cpu-features-fix.diff'
	'electron-builder-config.diff'
	'fix-argv.diff'
)
b2sums=('5af4cb94aba22f909dc56098f2fc1babc6fc7794f7702e42737f0a1f43ab3e49ca551da591cb31039e4145fec56c73de6b626668612ebd57a0197aa689834866'
        '54b46275a83a6099b22bc511a6293178abccccad6d1cc36bf812166f93f75b1379a3201dac9ee85e05cf7c3b0de7e94829fd3fb619ccca513924ebf3101850f0'
        'a9c56c31bf874308c09c54f3b9b94605a5de476f2db959984fcf1c16c3825d019f93f150559bb7c6fa8008c8ac3065b16e883561d9d9c7f9d09f753897028371'
        'efede58d6b059899937409bbc3dac5751cdffd92342e66c746983f6b75a69002bb088ded6300acc2245d1274ef306aee7828a1ee13480915ddc4fd39e6329b32'
        '160220f17f5e6ae1ceed499587bb9e6d07d8b34934cdc6c12931c41c7cf5a9b255e569f47e49073351b96b43bfbdb0a4387f4dfadbeb341547e4cde302e81e51')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/cpu-features-fix.diff"
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
