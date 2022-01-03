# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: daregakimeta <daregakimeta@mailbox.org>

_plugin_name='accept-language-per-site'
pkgname="firefox-extension-${_plugin_name}"
pkgver=0.2.3
pkgrel=1
pkgdesc='Firefox extension to change Accept-Language for different sites'
arch=('any')
url='https://github.com/sorz/accept-language-per-site'
license=('custom:MIT')
groups=('firefox-addons')
depends=('firefox')
makedepends=('jq' 'zip')
options=('!strip')

source=("${pkgname}-${pkgver}.zip::https://github.com/sorz/accept-language-per-site/archive/refs/tags/v${pkgver}.zip")
sha512sums=('97106aca7bb67a8e601653806aa82e6db41f68b27c99c72f1f69beb3edeb08097b63a582a3cd562541b977dea9366e75d927139b1b522fbbe5762b32e71a6ef5')

build() {
  rm -f "${srcdir}/.gitignore"
  cd "${srcdir}/${_plugin_name}-${pkgver}"
  zip -X --filesync --recurse-paths \
    "${srcdir}/${pkgname}-${pkgver}.xpi" -- *
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t \
    "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_plugin_name}-${pkgver}/LICENSE"

  echo >&2 'Packaging the extension'
  _gecko_id="$(jq -r '.applications.gecko.id' \
    "${_plugin_name}-${pkgver}/manifest.json")"
  install -D -m 644 -T \
    "${srcdir}/${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
