# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=superconductor
pkgver=0.11.1
pkgrel=1
_appname="SuperConductor-$pkgver"
pkgdesc="A playout client for Windows/Linux/macOS that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more"
arch=(any)
url="https://github.com/SuperFlyTV/SuperConductor"
license=(AGPL3)
depends=('nodejs>=18' 'alsa-lib' 'libvips')
makedepends=('rsync' 'yarn')
provides=('superconductor')
conflicts=('superconductor')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	'superconductor.desktop'
	'tsr-bridge.desktop')
sha256sums=('de0e256d3fbc5a07a6dd4f23aea8f691ebbb057e893c9c58f493419b615dc8da'
            'e11ebb8fab5d344b103cccb1b4547f66e742d55f59d8add32476f947beb23069'
            '7e3f99900f3feb6f4d9bae385adaa42a6aae46a8ac8ebcd2bd69b9dfac5e93ea')

prepare() {
	cd $_appname
	# Add '--ignore-scripts' if prepare fails
	yarn
}

build() {
	cd $_appname
	yarn build
	yarn build:binary
}

package() {
	mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share
	# Install SuperConductor
	rsync -av $_appname/apps/app/dist/linux-unpacked/* "$pkgdir"/usr/share/$pkgname
	ln -sf /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
	# Install TSR-Bridge
	rsync -av $_appname/apps/tsr-bridge/dist/linux-unpacked/* "$pkgdir"/usr/share/tsr-bridge
	ln -sf /usr/share/tsr-bridge/tsr-bridge "$pkgdir"/usr/bin/tsr-bridge
	# Install icons
	for i in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm 644 "$_appname/apps/app/build/icons/${i}x${i}.png" \
			"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
	done
	install -Dm 644 "$_appname/apps/tsr-bridge/assets/tray.png" \
		"$pkgdir"/usr/share/icons/hicolor/48x48/apps/tsr-bridge.png
	# Install desktop files, license
	install -Dm644 -t "$pkgdir"/usr/share/applications $pkgname.desktop
	install -Dm644 -t "$pkgdir"/usr/share/applications tsr-bridge.desktop
	install -Dm 644 $_appname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
