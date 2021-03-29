# Maintainer: Plaunarome <plaunarome@protonmail.com>

pkgname=firefox-tosdr
pkgver=4.0.7
pkgrel=1
pkgdesc="Get informed instantly about websites' terms and privacy policies"
arch=("any")
url="https://tosdr.org/"
license=("AGPL3")
groups=("firefox-addons")
makedepends=("jq" "zip")
source=("https://github.com/tosdr/browser-extensions/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7bd2081ea8df031b1cb0f9f933aa9ad0516effab92b2671e00c902e988bb8d833642bed81394f0990f3c910c800db2f5e748ca192bc0241e9bb16635174d123f')

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
