# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='{2d0ade95-bf3c-4868-b877-71ccd038e11b}'
_plugin_name='hohser'
pkgname="firefox-extension-${_plugin_name}"
pkgver=4.5.0
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

sha512sums=('5c6035a59a50c5098e55ac88489375adee9198c04aa777e951534bd046f9d6e8eeb06bb14642eb95bbe27e2277b884ee85020b7f76d59bcc468b9819cd30f990')

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
