# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='{2d0ade95-bf3c-4868-b877-71ccd038e11b}'
_plugin_name='hohser'
pkgname="firefox-extension-${_plugin_name}"
pkgver=4.0.0
pkgrel=2
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
  '558b6e7ffba5c6065e895a4bc2e5ac1e6e79740be4c836d0711a22a8bd0ec91915564bc4a753b2356c23b85500701a9103720f23b6c8e1794dc868a95c8d489d'
)

build() {
  cd "${srcdir}/${_plugin_name}-v.${pkgver}"
  # Compatibility with nodejs 17
  yarn upgrade \
    css-loader@^6.5.1 \
    node-sass@^7.0.1 \
    postcss@^8.4.5 \
    sass-loader@^12.4.0

  yarn install
  yarn build
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
