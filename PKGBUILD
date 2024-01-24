# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgbase=superconductor
pkgname=(
	superconductor
	tsr-bridge
)
pkgver=0.11.2
pkgrel=1
_appname="SuperConductor-$pkgver"
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('AGPL3')
makedepends=(
	'yarn' 
	'nodejs>=16.16.0'
	'nodejs<=20'
)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'superconductor.desktop'
	'tsr-bridge.desktop')
sha256sums=('5e8dc4f1b2fc86886b8394a4d2d33ca7863b1b6e9ac1ca5e6cd48a8ce69f0802'
            'e11ebb8fab5d344b103cccb1b4547f66e742d55f59d8add32476f947beb23069'
            '7e3f99900f3feb6f4d9bae385adaa42a6aae46a8ac8ebcd2bd69b9dfac5e93ea')

prepare() {
	cd $_appname
	# Workaround for 'husky - .git can't be found'
	mkdir -p .git
	# Installs all dependencies, including Lerna.
	yarn install --cache-folder ../yarn-cache
}

build() {
	cd $_appname
	# Compile Typescript, run Webpack, etc:
	yarn build
	# Make binaries for the SuperConductor UI and tsr-bridge. Must have run "yarn build" first.
	# The SuperConductor UI binary will be located at apps/app/dist.
	# The tsr-bridge binary will be located at apps/tsr-bridge/dist.
	# This command should work on all platforms (Windows, macOS, and Linux).
	yarn build:binary
}

package_superconductor() {
	pkgdesc='A playout client for Windows/Linux/macOS that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more'
	depends=('alsa-lib' 'libvips')
	optdepends=('tsr-bridge: External application which handles the actual playout and control of the connected devices')
	provides=('superconductor')
	conflicts=('superconductor')

	install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share
	# Install SuperConductor
	cp -av --no-preserve=ownership $_appname/apps/app/dist/linux-unpacked "$pkgdir"/usr/share/$pkgname
	ln -sf /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

	# Install icons
	for i in 16 24 32 48 64 96 128 256 512 1024; do
		install -vDm 644 "$_appname/apps/app/build/icons/${i}x${i}.png" \
			"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
	done

	# Install desktop files, license
	install -vDm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications
	install -vDm644 $_appname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_tsr-bridge() {
	pkgdesc='The TSR-bridge is the application which handles the actual playout and control of the connected devices. By default, an instance of TSR-bridge runs internally in SuperConductor, so devices can be controlled directly from the application'
	depends=('alsa-lib' 'libvips' 'superconductor')
	provides=('tsr-bridge')
	conflicts=('tsr-bridge')

	install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share
	# Install TSR-Bridge
	cp -av --no-preserve=ownership $_appname/apps/tsr-bridge/dist/linux-unpacked "$pkgdir"/usr/share/tsr-bridge
	ln -sf /usr/share/tsr-bridge/tsr-bridge "$pkgdir"/usr/bin/tsr-bridge

	# Install icons
	install -vDm 644 "$_appname/apps/tsr-bridge/assets/tray.png" \
		"$pkgdir"/usr/share/icons/hicolor/48x48/apps/tsr-bridge.png

	# Install desktop files
	install -vDm644 tsr-bridge.desktop -t "$pkgdir"/usr/share/applications
}
