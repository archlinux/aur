# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='4.1.13'
pkgrel='2'
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
sha512sums=('230d81fd980461c5decdb6acd2266257997a218d11a1d37c8df469660a048f3dbe6e431ae481f2ee08390d4fa226e2961494d1a0dc00d206372db24fe78208e8'
            'e6b9a9ac3c62cc2b040c4ece48ab27a29e1ba8fbf2c3d45f299aeb7c2b0a967acb8e84171f5d71f63ebedba52a8f376beab40e8889bda668341aa1d9da50bd47'
            'e8d3a8d41bc15082096430e7fbfbd1deb15a82f7f1af6238f50cf2dc002e191913b21329123831522c7d4b9ea77dc441fa8b3a59c32c21f0ffa4c93256331cee'
            '467d1ef0fc106db9cc878b11e197137f66648bd00e6e49de08ac596f06ee76369134707b0927d89ed001d43d4290b13388e48bdeb96dff1a5b339b03c8a22ff2')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/vue.config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/vue.config.js'

	# Replace package name, flag file name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" -e "s/%%FLAGFILENAME%%/bks/g" "$srcdir/electron-launcher.sh"

	# Update node-sass and sass-loader to be compatible with current node and Linux version
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	yarn add 'node-sass@9.0.0' 'sass-loader@10.5.2' --ignore-engines

	# Install dependencies
	cd "$srcdir/$_sourcedirectory/"
	yarn install --ignore-engines
}

build() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	# The build gets stuck in an infinite loop if debug output is not enabled
	DEBUG='*' NODE_OPTIONS='--openssl-legacy-provider' yarn run vue-cli-service electron:build
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
	tar -xf "$pkgname-$(printf "$pkgver" | sed 's/\.0$//').pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cd "$srcdir/$pkgname-$pkgver-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
