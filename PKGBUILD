# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='3.9.18'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
# If you're running on pentium4, you have to add it to the arch and source arrays of the electron18-bin AUR dependency
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
_electronpkg='electron18'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-builder-config.diff'
	'configure-environment.diff'
	'fix-argv.diff'
)
sha512sums=('78080d82e33b171010b6633bf9c2e93b8375c2e1619ee4f3361f467c5043f512c279f91845b9a919605c42b06d5c5eefb054904ca2e6ea900d8680bcdc22a581'
            '4e1498e4ccd35eecd8ed1392f903e559e9d400f142ca4c53763f9d092604edae924009862c9ec937a0625b92aed8259fc4de3642d9014db9d6769e88a18c283f'
            '1a631deaee10d876c875b215cb47d02f86949438bbcf0c1625b1a899d5ddfc10876cdd46460107a36cf5ee2171b7da26acf9fe7015baa279f5d5b3618ed4eddc'
            'e74d6d85fe4ddd2606efb49834e37f81e44a79270f0be79ea7ea33cfe2759c906a49d6a8bfb761b7877c4511dc6b7ca92484ef3fa15c7f30178cf0b71c56d52d')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/configure-environment.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"

	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'apps/studio/vue.config.js'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'apps/studio/vue.config.js'

	# Update node-sass and sass-loader to be compatible with current node and Linux version
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	yarn add 'node-sass@8.0.0' 'sass-loader@10.4.1' --ignore-engines

	# Install dependencies
	cd "$srcdir/$_sourcedirectory/"
	NODE_OPTIONS='--openssl-legacy-provider' yarn install --ignore-engines
}

build() {
	cd "$srcdir/$_sourcedirectory/apps/studio/"
	NODE_OPTIONS='--openssl-legacy-provider' yarn run vue-cli-service electron:build
}

package() {
	# Electron resources
	cd "$srcdir/$_sourcedirectory/apps/studio/dist_electron/"
	install -Dm644 'linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/public/' "$pkgdir/usr/lib/$pkgname/public/"

	# Binary
	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
exec $_electronpkg '/usr/lib/$pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"

	# Extract pacman archive and copy files
	mkdir -p "$srcdir/$pkgname-$pkgver-pacman/"
	tar -xf "$pkgname-$(printf "$pkgver" | sed 's/.0$//').pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cd "$srcdir/$pkgname-$pkgver-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
