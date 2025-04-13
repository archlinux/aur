# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Contributor: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=bdaa01291b7367a5e815470fd263ea36c862fe32
pkgname=firefox-extension-multi-account-containers
pkgver=8.2.0
pkgrel=1
pkgdesc="Firefox extension that lets you assign websites to isolated containers to help protect privacy."
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

prepare() {
	cd "${_name}-${pkgver}/"
	npm install --legacy-peer-deps --cache "${srcdir}/npm-cache/"

	# Locale files are in a submodule. We do not have git info here so we have to insert it manually.
	rmdir src/_locales/
	ln --symbolic "../../${_name}-l10n-${_l10n_version}" src/_locales
}

build() {
	cd "${_name}-${pkgver}/src/"
	../node_modules/web-ext/bin/web-ext.js build --filename extension.zip --overwrite-dest

	mkdir repack/
	cd repack/
	unzip ../web-ext-artifacts/extension.zip
	find -exec touch --date @0 {} \;

	zip "${srcdir}/extension.zip" -X --filesync --recurse-paths -- *
	cd ../
	rm --recursive repack/
}

check() {
	cd "${_name}-${pkgver}/"
	npm run test:once
}

package() {
	install -D --mode 644 -- extension.zip \
		"${pkgdir}/usr/lib/firefox/browser/extensions/@testpilot-containers.xpi"
}
