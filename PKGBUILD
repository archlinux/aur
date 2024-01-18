# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: daregakimeta <daregakimeta@mailbox.org>

_plugin_name='accept-language-per-site'
pkgname="firefox-extension-${_plugin_name}"
pkgver=0.3.6
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
sha512sums=('aa9d52c06ae0848566acf209597505d58cb6a56e4ecddfa42c1b4800cc30cfaca0fb80303a75d82b28d360c90062faadbfb228d0037e5dd4e26502db6a9d2dc2')

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
