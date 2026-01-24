# Maintainer: Network_Jack <Network_Jack@null.net>
# Contributor: Kamil Śliwak <cameel2@gmail.com>
# Contributor: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
_l10n_version=bdaa01291b7367a5e815470fd263ea36c862fe32
pkgname=librewolf-extension-multi-account-containers
pkgver=8.3.5
pkgrel=1
pkgdesc="Keep parts of your online life separated into color-coded tabs"
arch=("any")
url="https://github.com/mozilla/${_name}"
license=("MPL2")
groups=("librewolf-addons")
makedepends=("npm" "unzip" "zip")
source=(
	"${url}/archive/${pkgver}/${_name}-${pkgver}.tar.gz"
	"https://github.com/mozilla-l10n/${_name}-l10n/archive/${_l10n_version}.tar.gz"
)
sha512sums=('7a0d9896566dd6929cdd750df333705af163f8ef3689278d69bb5f5d0c8b3bc685176a32381846a0e1afc3e09de3bffe2deb5544ecf23bc874b4ba421b30fed4'
            'f6b9e7af7e1cd2cc48f530890576f03daaaf4d39137673be10eff3a3cfad68943be767727a0f224c986428b620c3362c835812db845f1fc76f17cd0a3647b303')

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
		"${pkgdir}/usr/lib/librewolf/browser/extensions/@testpilot-containers.xpi"
}

