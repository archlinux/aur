# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='3.9.4.0'
_packagejsonver='3.9.4'
pkgrel='1'
epoch='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
# If you're running on armv7h or aarch64, use the electron22-bin package from the AUR for the electron dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron22-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
_electronpkg='electron'
depends=("$_electronpkg>=22.0.0")
makedepends=('git' 'libxcrypt-compat' 'nodejs>=16.0.0' 'nodejs<19.0.0' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-builder-config.diff'
	'configure-environment.diff'
	'fix-argv.diff'
)
sha512sums=('c95cb879aecfa313caaf72a177f12b3b8d842e459fdaaa3fb706cbade11644507f33ca78648fe371aba87ba336c563c366fca29f0e6da6a55e2bae26aee5d730'
            '2bc5d50b17ecc90d9bbe99b528f1ea323e7afda75a92faf645a33ad296e4cdf8fb13e2d4853dcc369571fca131e8c4bf94bda8c6464536c67c434bc589fec4b2'
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

	yarn install --ignore-engines
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
	mkdir -p "$srcdir/$pkgname-$pkgver-$pkgrel-pacman/"
	tar -xf "$pkgname-$_packagejsonver.pacman" --directory "$srcdir/$pkgname-$pkgver-$pkgrel-pacman/"
	cd "$srcdir/$pkgname-$pkgver-$pkgrel-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
