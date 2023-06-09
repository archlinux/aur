# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='wappalyzer@crunchlabz.com'
_plugin_name='wappalyzer'
pkgname="firefox-extension-${_plugin_name}"
pkgver=6.10.62
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
  'f6e0d47f5bbda37d6712d78e7e27074b3e57c15959037da1dc172911d5915975219e613b19bda4ff2e3040ff08f12da737972b4bc217d03ad69d423c331de791'
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
