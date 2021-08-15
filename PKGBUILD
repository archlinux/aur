# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
pkgname=firefox-extension-multi-account-containers
pkgver=7.4.0
pkgrel=1
pkgdesc="Keep parts of your online life separated into color-coded tabs"
arch=("any")
url="https://github.com/mozilla/${_name}"
license=("MPL2")
groups=("firefox-addons")
makedepends=("npm" "unzip" "zip")
source=("${url}/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('a457c20132780e43ecbcecd3925e75df0ee441c02c3b2c0bdb18d0bf3a98918961bd5c81b439c841fd2616e385536cae757412e41dadc32e0738d56d8415f809')

build() {
	cd "${_name}-${pkgver}"
	npm install --legacy-peer-deps
	cd src

	rm --force --recursive web-ext-artifacts
	../node_modules/web-ext/bin/web-ext build --filename extension.zip --overwrite-dest

	cd web-ext-artifacts
	unzip extension.zip
	rm extension.zip
	find -exec touch --date @0 {} \;

	zip "${srcdir}/extension.zip" -X --filesync --recurse-paths -- *
}

check() {
	cd "${_name}-${pkgver}"
	rm --force --recursive src/web-ext-artifacts
	npm test
}

package() {
	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/@testpilot-containers.xpi"
}
