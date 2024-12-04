# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
pkgbase=metamask
pkgname=(
  "${pkgbase}-chromium"
  "${pkgbase}-firefox"
  "${pkgbase}-google-chrome"
)
pkgver=12.8.0
pkgrel=1
pkgdesc='Browser extension that enables browsing Ethereum blockchain enabled websites'
url="https://github.com/MetaMask/metamask-extension"
license=('LicenseRef-ConsenSys')
groups=('firefox-addons')
arch=('any')
depends=()
makedepends=('git' 'nodejs-lts-iron' 'chromium')
source=(
  "${pkgbase}::git+$url.git#tag=v${pkgver}"
  "chrome.pem"
)
sha512sums=(
  'SKIP'
  '6732e47d2431484e084512e815e44590c6693d9a1f7a192c0de2f11561fdfd6d87769a375650c4025ab8e2049fd7694ff2c45e19a03991d65c9b8a241bd7292a'
)
_chromium_extension_id="cfcbhkcbidaoaeljekeilbnebipmnkjm"

prepare() {
  cd "${srcdir}/${pkgbase}"
  cp .metamaskrc.dist .metamaskrc
  # set infura project id
  sed -i -e 's/00000000000/2f8ebfee0f81453d83fe6219b9a59754/g' .metamaskrc
  corepackdir="${srcdir}/corepack"
  mkdir -p "${corepackdir}"
  corepack enable --install-directory="${corepackdir}"
}

build() {
  cd "${srcdir}/${pkgbase}"
  corepackdir="${srcdir}/corepack"
  export PATH="${corepackdir}:$PATH"
  corepack yarn # setup
  corepack yarn dist:mv2
  chromium \
    --disable-gpu \
    --disable-namespace-sandbox \
    --pack-extension="${srcdir}/${pkgbase}/dist/chrome" \
    --pack-extension-key="${srcdir}/chrome.pem"
}

package_metamask-chromium() {
  crx_path="/usr/lib/chromium-extension-metamask/metamask-${pkgver}.crx"
  cat > "${srcdir}/${_chromium_extension_id}.json" <<EOF
{
	"external_crx": "${crx_path}",
	"external_version": "${pkgver}"
}
EOF
  install -Dm644 "${srcdir}/${pkgbase}/dist/chrome.crx" "${pkgdir}${crx_path}"
  install -Dm644 "${srcdir}/${_chromium_extension_id}.json" \
                 "${pkgdir}/usr/share/chromium/extensions/${_chromium_extension_id}.json"
  install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_metamask-google-chrome() {
  crx_path="/usr/lib/google-chrome-extension-metamask/metamask-${pkgver}.crx"
  cat > "${srcdir}/${_chromium_extension_id}.json" <<EOF
{
	"external_crx": "${crx_path}",
	"external_version": "${pkgver}"
}
EOF
  install -Dm644 "${srcdir}/${pkgbase}/dist/chrome.crx" "${pkgdir}${crx_path}"
  install -Dm644 "${srcdir}/${_chromium_extension_id}.json" \
                 "${pkgdir}/usr/share/google-chrome/extensions/${_chromium_extension_id}.json"
  install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_metamask-firefox() {
  install -Dm644 "${srcdir}/${pkgbase}/builds/metamask-firefox-${pkgver}.zip" \
                 "${pkgdir}/usr/lib/firefox/browser/extensions/webextension@metamask.io.xpi"
  install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
