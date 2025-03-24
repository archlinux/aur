# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='{2d0ade95-bf3c-4868-b877-71ccd038e11b}'
_plugin_name='hohser'
pkgname="firefox-extension-${_plugin_name}"
pkgver=4.6.1
pkgrel=1
pkgdesc='Highlight or hide search engine results'
arch=('any')
url='https://github.com/pistom/hohser'
license=('MPL-2.0')
groups=('firefox-addons')
depends=('firefox')
makedepends=('yarn')
options=('!strip')

source=(
  "${_plugin_name}-${pkgver}.tar.gz::https://github.com/pistom/hohser/archive/v.${pkgver}.tar.gz"
)

sha512sums=('6e15f3a63b7e2a1ab006cf0bab44d5eb4fc5f6b67e74af1a05058284c8d6a3f8bdd6a4ef8d0c9d8a13077d1e29f60cec1abb2293a31a798bc41d7cb055b2e424')

prepare() {
  cd "${srcdir}/${_plugin_name}-v.${pkgver}"
  corepack yarn install
}

build() {
  cd "${srcdir}/${_plugin_name}-v.${pkgver}"
  corepack yarn build
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_plugin_name}-v.${pkgver}/LICENSE"

  echo >&2 'Packaging the extension'
  install -D -m 644 -T \
    "${srcdir}/${_plugin_name}-v.${pkgver}/build/${_plugin_name}-${pkgver}_firefox.zip" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
