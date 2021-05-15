# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="{59812185-ea92-4cca-8ab7-cfcacee81281}"
_name="rikaichamp"
pkgname=firefox-extension-rikaichamp
pkgver=0.5.5
pkgrel=1
pkgdesc="Translate Japanese by hovering over words"
arch=('any')
url="https://github.com/birtles/${_name}"
license=('GPL3')
groups=("firefox-addons")
depends=("firefox")
makedepends=("yarn" "nodejs>=12")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('801023753dddd60550c56644c135655a82d5859d35ce6eafe9e16764e8b58384')


build() {
    cd "${_name}-${pkgver}"

    # NOTE: --ignore-scripts is here only to skip the 'postinstall' hook from package.json.
    # The hook installs Husky (a commit linter). It's not needed to build a package (we do
    # not even check the project repo anyway) and its installation fails if the PKGBUILD
    # happens to be inside a directory tree that already contains a .git/ directory at the top.
    yarn install --pure-lockfile --ignore-scripts
    yarn build
    yarn package
}

check() {
    cd "${_name}-${pkgver}"
    yarn test:unit
}

package() {
    cd "${_name}-${pkgver}"
    install -D --mode 644 -- "dist-firefox-package/${_name}_japanese_dictionary-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
