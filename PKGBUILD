# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: daregakimeta <daregakimeta@mailbox.org>

_plugin_name='accept-language-per-site'
pkgname="firefox-extension-${_plugin_name}"
pkgver=0.4.0
pkgrel=1
pkgdesc='Firefox extension to change Accept-Language for different sites'
arch=('any')
url='https://github.com/sorz/accept-language-per-site'
license=('MIT')
groups=('firefox-addons')
depends=('firefox')
makedepends=('jq' 'zip')
options=('!strip')

source=("${pkgname}-${pkgver}.zip::https://github.com/sorz/accept-language-per-site/archive/refs/tags/v${pkgver}.zip")
sha512sums=('180989b4d5271b90836fc4fe0c17d326df12857bf65190b20129e19417bfaa2bb99e9dad0ae68a497fb1ce7eff44e80aecec13fbd232cb359179dd02ed011c48')

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
  _gecko_id="$(
    jq -r '
      .browser_specific_settings.gecko.id
      // error("Unknown property")
      ' "${_plugin_name}-${pkgver}/manifest.json"
  )"
  install -D -m 644 -T \
    "${srcdir}/${pkgname}-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
