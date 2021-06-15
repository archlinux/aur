# Maintainer: Plaunarome <plaunarome@protonmail.com>

pkgname=firefox-tosdr
pkgver=4.1.1
pkgrel=1
pkgdesc="Get informed instantly about websites' terms and privacy policies"
arch=("any")
url="https://tosdr.org/"
license=("AGPL3")
groups=("firefox-addons")
makedepends=("jq" "zip")
source=("https://github.com/tosdr/browser-extensions/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d551e5be8b64fb42ea916cc64ec10b7318a83a74ce6ff332c53d99a5883db7cb4bbddefff1e4eb4820ce1d43deb5e0ec0386916e726848e040271bf2811cd631')

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
