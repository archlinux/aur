# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Erik Moldtmann <erik@moldtmann.de>
_projectname='ExpressLRS-Configurator'
pkgname="${_projectname,,}"
pkgver='1.6.1'
pkgrel='1'
pkgdesc='Cross platform configuration & build tool for the ExpressLRS radio link'
# If you're running on armv7h or aarch64, use the electron20-bin package from the AUR for the electron20 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron20-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ExpressLRS/$_projectname"
license=('GPL-3.0-only')
_electronpkg='electron20'
depends=("$_electronpkg" 'platformio-core-udev' 'python>=3.0.0')
makedepends=('nodejs>=16.0.0' 'npm>=6.0.0' 'libxcrypt-compat' 'yarn>=1.21.3')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'fix-i18n-location.diff'
	'electron-builder-config.diff'
)
sha512sums=('814382992a22a8c59e9dfbade10bbba930ca9085161f4ca7bb6cb9828910f6cbc4299d9b4afb81fe42cdc4782489fa9bd324cab92e908839d2e6f1fadc64ab28'
            'c00d5973f4d9bb949edc498bd0a4577a394f6003b3337e12783a1febbb95579cfbda9fe53dc13a9ce5d029871b0c2bf95f30b0b95ae3116c684fa31f8779bfd1'
            'b234a14ed809004165dbecec399521eea9ede8186a46f9565dfae2b37e429c2e6f23ce208443896f02eb4ce81ba09cbfd4ce943298300a336bda4cd134d2aded'
            '30576c2cc5e7c78e25090e6a00fa9a2d3fb91fc19b476f97104f6f7be3dc1851520e2596c4fb04d7eb284dc3866b373c83bf5715a8e0074453ed3ae270998513')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace package name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" "$srcdir/electron-launcher.sh"

	# Disable husky, as it only works with a cloned repo
	sed -i '/husky install/d' 'package.json'

	# Fix i18n directory location
	patch --forward -p1 < "$srcdir/fix-i18n-location.diff"

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' 'package.json'

	# Update electron-builder config
	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'package.json'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Install dependencies
	NODE_OPTIONS='--openssl-legacy-provider' yarn install
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	NODE_OPTIONS='--openssl-legacy-provider' yarn build
	yarn electron-builder
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	yarn test
}

package() {
	# Electron resources
	cd "$srcdir/$_sourcedirectory/release/"
	install -Dm644 'linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/dependencies/' "$pkgdir/usr/lib/$pkgname/dependencies/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/app.asar.unpacked/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/assets/' "$pkgdir/usr/lib/$pkgname/assets/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/devices/' "$pkgdir/usr/lib/$pkgname/devices/"
	cp -r --no-preserve=ownership --preserve=mode 'linux-unpacked/resources/i18n/' "$pkgdir/usr/lib/$pkgname/i18n/"

	# Binary
	install -Dm755 "$srcdir/electron-launcher.sh" "$pkgdir/usr/bin/$pkgname"

	# Extract pacman archive and copy files
	mkdir -p "$srcdir/$pkgname-$pkgver-pacman/"
	tar -xf "$pkgname-$pkgver.pacman" --directory "$srcdir/$pkgname-$pkgver-pacman/"
	cd "$srcdir/$pkgname-$pkgver-pacman/"

	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/applications' "$pkgdir/usr/share/applications/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/share/icons' "$pkgdir/usr/share/icons/"

	# Get rid of binary path in desktop file
	sed "s|^Exec=\"/opt/ExpressLRS Configurator/$pkgname\"|Exec=$pkgname|" -i "$pkgdir/usr/share/applications/$pkgname.desktop"
}
