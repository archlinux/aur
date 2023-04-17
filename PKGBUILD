# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=417e6294ed767914b617a5e56ccbe67482df181c
pkgname=firefox-extension-multi-account-containers
pkgver=8.1.2
pkgrel=1
pkgdesc="Keep parts of your online life separated into color-coded tabs"
arch=("any")
url="https://github.com/mozilla/${_name}"
license=("MPL2")
groups=("firefox-addons")
makedepends=("npm" "unzip" "zip")
source=(
	"${url}/archive/${pkgver}/${_name}-${pkgver}.tar.gz"
	"https://github.com/mozilla-l10n/${_name}-l10n/archive/${_l10n_version}.tar.gz"
)
sha512sums=(
	'6df6ab64140d317ee7f4cb2158f60a3ae27523d624e9aa413ebf81e372d1c9b8b60c6a6491388bd1bf3b7502118175d39cd154e397d4e9ac691b3e2dbef38cfa'
	'a41d5e8cf691271587dbe224d78b4b97db2f86c76094c6449eb36a72f7b42e9703a990a9ea2429f37d271f03146106270b67b0f5dfa1d1315a414bcb89ae0872'
)

build() {
	cd "${_name}-${pkgver}"
	npm install --legacy-peer-deps
	cd src

	# Locale files are in a submodule. We do not have git info here so we have to insert it manually.
	rm -rf _locales
	ln -s "../../${_name}-l10n-${_l10n_version}" "_locales"

	rm --force --recursive web-ext-artifacts
	../node_modules/web-ext/bin/web-ext.js build --filename extension.zip --overwrite-dest

	cd web-ext-artifacts
	unzip extension.zip
	rm extension.zip
	find -exec touch --date @0 {} \;

	zip "${srcdir}/extension.zip" -X --filesync --recurse-paths -- *
}

check() {
	cd "${_name}-${pkgver}"
	rm --force --recursive src/web-ext-artifacts
	npm run test:once
}

package() {
	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/@testpilot-containers.xpi"
}
