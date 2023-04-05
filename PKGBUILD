# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='3.9.1.0'
_packagejsonver='3.9.1'
pkgrel='2'
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
	'debug.diff'
)
sha512sums=('15a1db20d5be8a3807b4efe138b526abd2d300f018b20740f060be4a35f5c47bc7712d5b6d09b5e69fda51f72be9c8d68a09b122a012b0cbf6d3ad6cd5672c55'
            'c8c63ffdc75ec73f6258aa0020b228f86d883de0c6608b14b3a35604dfeaebac7ae89f0dbc57b3bbb922cbfc3231117d769488f194961c68af646574d9ea49e0'
            'dc653535664904c74c812b589881994c1109c664f9174186ccd362a42172edeb0251712c98f3c9a17d7356bf47f942eff03c2294181402ff9cbc9cb211616d57'
            'e26142437693fbadb34e8421507770458658311c8c199f3333730961600716ecf1b89de438f0b36c56f387804a4b9a708b32f5ec0e89765bb9fdbc8c44b6fcc7'
            'f9adf19932ba34b9662f1fb6bb6b77cada68e37d330cae4639cc70b91500d09800bdda5cd1247319b30a4d034630528abbd0b5eaa34fe3c0be73f41deceb0e39')

_sourcedirectory="$pkgname-$pkgver"


prepare() {
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	patch --forward -p1 < "$srcdir/configure-environment.diff"
	patch --forward -p1 < "$srcdir/fix-argv.diff"
	patch --forward -p1 < "$srcdir/debug.diff"

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
