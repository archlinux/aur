# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: daregakimeta <daregakimeta@mailbox.org>

_plugin_name='accept-language-per-site'
pkgname="firefox-extension-${_plugin_name}"
pkgver=0.3.5
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
sha512sums=('0edd2b8785a5d6cf0b73fb5d5ae983108ba847b444fb5d960c9ef8a6ba272847b5b5f6d945408261a09e10390fca3b806f5d8ae744053c7254dc598667c3143c')

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
