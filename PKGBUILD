# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

_gecko_id='wappalyzer@crunchlabz.com'
_plugin_name='wappalyzer'
pkgname="firefox-extension-${_plugin_name}"
pkgver=6.10.41
pkgrel=1
pkgdesc='Identify technology on websites'
arch=('any')
url='https://github.com/wappalyzer/wappalyzer'
license=('MIT')
groups=('firefox-addons')
depends=('firefox')
makedepends=('jq' 'libxss' 'nodejs' 'yarn' 'zip')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/wappalyzer/wappalyzer/archive/v${pkgver}.tar.gz"
  'puppeteer-no-sandbox.patch'
)

sha512sums=(
  'fc9ff1a8de3317f3ae7810601ee14ccc265fad658fb39f7cb16a6a3f4e3e05c6181dae026f58336089556d111cf3be99af7d48281fc70a7f9c59a26c5f9e6ee7'
  'd2ccd784adfccb76dd6ccb7db07fdcf94ad40bde100cd552fddf3516660a9526992e83757898f7efeff5818f83cebea49fcaeb44ba5349e339eb29a995669948'
)

build() {
  cd "${srcdir}/${_plugin_name}-${pkgver}"

  # Work around a crash in headless Chrome, which may occur in the
  # GPU thread. As a workaround [1], we tell Puppeteer to disable
  # sandboxing.
  # The web extension needs Chrome only at build time, and only for
  # converting SVG to PNG. The SVG is coming directly from the
  # source package. So we can safely disable the sandbox for this.
  #
  # [1]: https://github.com/puppeteer/puppeteer/issues/1543#issuecomment-349642975
  patch -p1 < "${srcdir}/puppeteer-no-sandbox.patch"

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
