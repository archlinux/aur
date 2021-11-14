# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=f3da295d004b7d6314c5baa321d9a5418ec937d9
pkgname=firefox-extension-multi-account-containers
pkgver=8.0.0
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
	'ebe5ae9a3bdb4de1862d3263795df775c097f2e68d03e0dec4c9c77e225f31c3f1bcb58d3729c19c7fbf6a23996e82b3d7683592129079cf249042ff5b49a336'
	'ae8d21be84b29337ba3b1377368a33e290323e7a445a305adc10beae2317775b539837e0272014c5f3f28348ddd9a6bbfff04aa60e5d64b826878ae44e8cd8ce'
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
