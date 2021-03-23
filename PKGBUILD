# Maintainer: Plaunarome <plaunarome@protonmail.com>

pkgname=firefox-tosdr
pkgver=4.0.6
pkgrel=1
pkgdesc="Get informed instantly about websites' terms and privacy policies"
arch=("any")
url="https://tosdr.org/"
license=("AGPL3")
groups=("firefox-addons")
makedepends=("jq" "zip")
source=("https://github.com/tosdr/browser-extensions/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('246f5553d5881dbf11d171423a50be9f010d1789d98a18a65740156c749f6ced0f71bf528ce44d373a8ff32979744f69757f914f3225d6542546e672b66fff58')

build() {
	rm --force --recursive build
	cd "browser-extensions-${pkgver}"
	cp --recursive src ../build
	jq --slurp '.[0] * .[1]' src/manifest.json firefox/manifest.json > ../build/manifest.json

	cd ../build
	find -exec touch --date @0 {} \;
	zip extension.zip -X --filesync --recurse-paths -- *
}

package() {
	install -D --mode 644 -- build/extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/jid0-3GUEt1r69sQNSrca5p8kx9Ezc3U@jetpack.xpi"
}
