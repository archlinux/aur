# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=837c56a671eadd18a43482e998410d107cb4144c
pkgname=firefox-extension-multi-account-containers
pkgver=8.0.9
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
	'4ec3cc36ba7d2158c50855b2a065f415ccdbf43bb6185fbe9648b59a19ea3a6d83662e7ff857c91d3874732e2915aeddaeb1248753d7d5bed06dd679523351f1'
	'c1850e584486758f164e4dbe459a9b39b06dbe5f1ce45804dad39b1bfa7abb8eae649ff75683742bfdbcce6abaf2ea5ef38b4e17690f28b1bb0960477b427622'
)

build() {
	cd "${_name}-${pkgver}"
	npm install --legacy-peer-deps
	cd src

	# Locale files are in a submodule. We do not have git info here so we have to insert it manually.
	rm -rf _locales
	ln -s "../../${_name}-l10n-${_l10n_version}" "_locales"

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
	npm run test:once
}

package() {
	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/@testpilot-containers.xpi"
}
