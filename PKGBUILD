# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Erik Moldtmann <erik@moldtmann.de>
_projectname='ExpressLRS-Configurator'
pkgname="${_projectname,,}"
pkgver='1.7.10'
pkgrel='1'
pkgdesc='Cross platform configuration & build tool for the ExpressLRS radio link'
# If you're running on armv7h or aarch64, use the electron27-bin package from the AUR for the electron27 dependency
# If you're running on armv7h, you have to add it to the arch and source arrays of the electron27-bin AUR dependency
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ExpressLRS/$_projectname"
license=('GPL-3.0-only')
_electronpkg='electron27'
depends=("$_electronpkg" 'platformio-core-udev' 'python>=3.0.0')
depends_armv7h=('lib32-gcc-libs' 'lib32-glibc')
makedepends=('nodejs>=16.0.0' 'npm>=6.0.0' 'libxcrypt-compat' 'yarn>=1.21.3')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'electron-launcher.sh'
	'fix-resource-locations.diff'
	'electron-builder-config.diff'
)
b2sums=('ae727dece45f770a40265e17e1675cb94896996d186e08e92734929cd33fed889ae74a5c16bb08b7c609f3b2aab078bb22a7f1db7ca3184a67034d444adc0380'
        'ac21805ec823b40ac925e1abec13edb8c4a3e5bbcfc65629b83e5923f4328dfccafb11c5c6895d8484cb730afce0a3977113d0d2266ba95d05216b4ea4077b4d'
        '5c965d0439a728f19f11b0341dc929e3c32525a3190718ffc386277405a9248bf25ad8d02f5da8168e2ae42d623ef16bcc9eb89af172db7aeee2f6ffa4015945'
        'fcf6859cdf2a2a71330b329add29328eb7a9075006383c627426ba43788ca4875f9108b8f1aa0da11f0bb6bb0d61a361aeb3f9666b69b54f7a2085fcf62640b5')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace package name and electron version in launcher script
	sed -i -e "s/%%PKGNAME%%/$pkgname/g" -e "s/%%ELECTRON%%/$_electronpkg/g" "$srcdir/electron-launcher.sh"

	# Fix resource directory locations
	patch --forward -p1 < "$srcdir/fix-resource-locations.diff"

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' 'package.json'

	# Update electron-builder config
	patch --forward -p1 < "$srcdir/electron-builder-config.diff"
	sed -i "s|%%ELECTRON_DIST%%|/usr/lib/$_electronpkg|g" 'package.json'
	sed -i "s|%%ELECTRON_VERSION%%|$(cat "/usr/lib/$_electronpkg/version")|g" 'package.json'

	# Install dependencies
	HUSKY=0 yarn install
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	yarn build
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
