# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='{2d0ade95-bf3c-4868-b877-71ccd038e11b}'
_plugin_name='hohser'
pkgname="firefox-extension-${_plugin_name}"
pkgver=4.1.3
pkgrel=1
pkgdesc='Highlight or hide search engine results'
arch=('any')
url='https://github.com/pistom/hohser'
license=('MPL2')
groups=('firefox-addons')
depends=('firefox')
makedepends=('yarn')
options=('!strip')

source=(
  "${_plugin_name}-${pkgver}.tar.gz::https://github.com/pistom/hohser/archive/v.${pkgver}.tar.gz"
)

sha512sums=(
  '26790a1901c7c232e0b0ab2a3691aca672d7c4d144eb28ca1f0bcd208ddfcdd4024c4236f19c3e13efffb73e797bb06797fbf2b9b1e322be56bc0ed7a2058c50'
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
