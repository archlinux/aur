# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='wappalyzer@crunchlabz.com'
_plugin_name='wappalyzer'
pkgname="firefox-extension-${_plugin_name}"
pkgver=6.10.65
pkgrel=1
pkgdesc='Identify technology on websites'
arch=('any')
url='https://github.com/wappalyzer/wappalyzer'
license=('GPL3')
groups=('firefox-addons')
depends=('firefox')
makedepends=('jq' 'libxss' 'nodejs' 'yarn' 'zip')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/wappalyzer/wappalyzer/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '79ec07e6cf09e0b4e12115ff436a186263959e69fe2ed4ce0bf759df7f499ef08d638bccdd74b4018f18f8fc9e437480c38200e796e9567440e3942a5833195f'
)

build() {
  cd "${srcdir}/${_plugin_name}-${pkgver}"
  /usr/bin/node /usr/bin/yarn install
  /usr/bin/node /usr/bin/yarn build "${pkgver}"

  cd src/drivers/webextension

  # Cherry-pick the v2 manifest version as long as Firefox doesn’t
  # support v3 by default.
  # Also, the Gecko ID is missing from the manifest so set it
  # while we’re at it.
  jq --arg geckoId "${_gecko_id}" \
    '.browser_specific_settings.gecko.id = $geckoId' \
    'manifest-v2.json' \
    > 'manifest.json'

  zip -X --filesync --recurse-paths \
    "${srcdir}/${pkgname}-${pkgver}.xpi" -- *
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_plugin_name}-${pkgver}/LICENSE"

  echo >&2 'Packaging the extension'
  install -D -m 644 -T \
    "${srcdir}/${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
