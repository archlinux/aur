# Maintainer: Plaunarome <plaunarome@protonmail.com>

pkgname=firefox-tosdr
pkgver=4.0.8
pkgrel=1
pkgdesc="Get informed instantly about websites' terms and privacy policies"
arch=("any")
url="https://tosdr.org/"
license=("AGPL3")
groups=("firefox-addons")
makedepends=("jq" "zip")
source=("https://github.com/tosdr/browser-extensions/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b6c80658718d5fa7f2449d2ced994f5511be249571f830e8f0f3f29d0f93b914a64d5dbe375670f840d38859af4625dc8d0ea6ee3177e2e75b01055f2350bfa4')

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
