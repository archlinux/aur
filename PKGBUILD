# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Maintainer: Cimu Wang <cimu58@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname='firefox-clearurls'
pkgver=1.27.3
_rules_commit=84aad0507669711a12e6ab652abcd0fac7d874bd
pkgrel=4
pkgdesc="Remove tracking elements from URL's."
arch=('any')
url="https://gitlab.com/ClearURLs/ClearUrls"
license=('LGPL-3.0')
depends=('firefox')
makedepends=('git' 'jq' 'zip')
source=("$pkgname::git+$url.git#tag=$pkgver"
        "data::git+https://gitlab.com/ClearURLs/rules.git#commit=$_rules_commit")
sha256sums=('92fbf6f534f255a9b7b87bc0332deb2a562a65da75495b6242506668b9138742'
            'f475cdc90239374af0cbc58ef9c2e3ebda68efccc2864476e8e51dcac250c70c')

prepare() {
  cd "$srcdir"
  mv data $pkgname
}

build() {
  cd "$srcdir"/$pkgname
  zip -r -FS ClearURLs.xpi \
    clearurls.js \
    browser-polyfill.js \
    manifest.json \
    img/* \
    external_js/* \
    html/* \
    core_js/* \
    css/* \
    fonts/* \
    _locales/*
}

package() {
  cd "$srcdir"/$pkgname
  _extension_id=$(jq -r '(.applications // .browser_specific_settings).gecko.id' manifest.json)
  install -Dm644 ClearURLs.xpi "$pkgdir"/usr/lib/firefox/browser/extensions/$_extension_id.xpi
}
