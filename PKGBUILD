# Maintainer: Kamil Śliwak <cameel2/gmail/com>

_gecko_id="jid1-xUfzOsOFlzSOXg@jetpack"
_name=Reddit-Enhancement-Suite
pkgname=firefox-extension-reddit-enhancement-suite
pkgver=5.22.17
pkgrel=1
pkgdesc="Suite of modules that enhances your Reddit browsing experience"
arch=(any)
url="https://github.com/honestbleeps/${_name}"
license=(GPL3)
groups=(firefox-addons)
depends=(firefox)
makedepends=(yarn)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('419a719c95e35d610a2f68bb9bebf8925ce536e96b2e6da31a10aec9442b8bbb')


build() {
    cd "${_name}-${pkgver}"
    yarn install

    # Workaround for ERR_OSSL_EVP_UNSUPPORTED during build.
    # See https://nodejs.org/en/blog/release/v17.0.0#openssl-3-0
    export NODE_OPTIONS=--openssl-legacy-provider

    yarn build --env browsers=firefox
}

package() {
    cd "${_name}-${pkgver}/"
    install -D --mode 644 -- "dist/zip/firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
