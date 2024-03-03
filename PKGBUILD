# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='{2d0ade95-bf3c-4868-b877-71ccd038e11b}'
_plugin_name='hohser'
pkgname="firefox-extension-${_plugin_name}"
pkgver=4.4.0
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

sha512sums=(
  '6d862ae9b37c84d822eb1704e45c8cc9ad06d57be6ebb636111800b2abfb45da586cb1f93f3846dfae48724dcecc361134644aac534f1bb1ddd3b544a0653a48'
)

build() {
  cd "${srcdir}/${_plugin_name}-v.${pkgver}"
  set -- /usr/bin/node /usr/bin/yarn
  "$@" install
  "$@" build
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
