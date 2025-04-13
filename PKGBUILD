# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=bdaa01291b7367a5e815470fd263ea36c862fe32
pkgname=firefox-extension-multi-account-containers
pkgver=8.2.0
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
	'561d45192490d176d525ffcb5b96b89e39da34d7bcb7b8282eca88e4b3e70af1e6d60f6077b5841f34199d942fd10a63481a1fe82acf37b517bf0c263ed5f9e0'
	'f6b9e7af7e1cd2cc48f530890576f03daaaf4d39137673be10eff3a3cfad68943be767727a0f224c986428b620c3362c835812db845f1fc76f17cd0a3647b303'
)

build() {
	cd "${_name}-${pkgver}"
	npm install --legacy-peer-deps --cache "${srcdir}/npm-cache/"
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
