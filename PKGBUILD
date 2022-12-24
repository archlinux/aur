# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='beekeeper-studio'
pkgver='3.7.10'
pkgrel='1'
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
_electronpkg='electron13'
depends=("$_electronpkg")
makedepends=('git' 'libxcrypt-compat' 'nodejs<19.0.0' 'npm' 'python' 'yarn')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-builder-config.diff'
	'configure-environment.diff'
	'fix-argv.diff'
)
sha512sums=('dd699e618a00cb7851d6366c8a6d818e1ff78c2ec6f7b319041053b665d7c0d0c5bb37d55887fe7f8757294f30d00651e3c540e1f5342094ac98df7d1e0d3117'
            'c8c63ffdc75ec73f6258aa0020b228f86d883de0c6608b14b3a35604dfeaebac7ae89f0dbc57b3bbb922cbfc3231117d769488f194961c68af646574d9ea49e0'
            'dc653535664904c74c812b589881994c1109c664f9174186ccd362a42172edeb0251712c98f3c9a17d7356bf47f942eff03c2294181402ff9cbc9cb211616d57'
            'ae6b5847bdf65f8fb43b3694c151f55c307b2b402624b627b755133b4173760fa4673158b77c252b8a9b18dc33be3068e2c79e23762a4de05de11447cf259c3c')

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
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/app.asar.unpacked/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
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
	tar -xf "$pkgname-$pkgver.pacman" --directory "$srcdir/$pkgname-$pkgver-$pkgrel-pacman/"
	cd "$srcdir/$pkgname-$pkgver-$pkgrel-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/mime' "$pkgdir/usr/share/mime/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/Beekeeper Studio/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
