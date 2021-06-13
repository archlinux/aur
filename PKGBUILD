# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="{59812185-ea92-4cca-8ab7-cfcacee81281}"
_name="rikaichamp"
pkgname=firefox-extension-rikaichamp
pkgver=0.5.8
pkgrel=1
pkgdesc="Translate Japanese by hovering over words"
arch=('any')
url="https://github.com/birtles/${_name}"
license=('GPL3')
groups=("firefox-addons")
depends=("firefox")
makedepends=("yarn" "nodejs>=12")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d967aa1779c79c08f85c7e22aae18ddb791d2aa399f5cf0a0f0b7757075b7d2')


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
