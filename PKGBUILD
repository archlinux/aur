# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgbase=metamask
pkgname=("${pkgbase}-chrome" "${pkgbase}-firefox")
_addon_id="2e742fd4-1e66-4604-89a2-b99cc03f171a"
pkgver=10.8.2
pkgrel=1
pkgdesc='Chrome extension that enables browsing Ethereum blockchain enabled websites'
url='https://github.com/MetaMask/metamask-extension'
license=('custom:consensys')
arch=('any')
depends=('chromium' 'typescript')
makedepends=('nodejs-lts-fermium' 'yarn')
source=(
  "${pkgbase}::git+$url.git#tag=v${pkgver}"
  "metamask_policy.json")
sha512sums=('SKIP'
            '912bc9a9ac604b8603bbc34bbc7793caaad4b796ecd3fe59dea2e2e53e22de9573fb9f84e5b2e3601bf2d9193d71f858b066e4a086a8818d9a97cb8fc8d141e4')

build() {
  cd "${srcdir}/${pkgbase}"
  yarn setup
  cp .metamaskrc.dist .metamaskrc
  sed -i -e 's/00000000000/2f8ebfee0f81453d83fe6219b9a59754/g' .metamaskrc
  yarn dist
}

package_metamask-chrome() {
  install -Dm644 "${srcdir}/metamask_policy.json" \
                 "${pkgdir}/etc/chromium/policies/managed/metamask_policy.json"
}

package_metamask-firefox() {
  extensions_dir="${pkgdir}/usr/lib/firefox/browser/extensions"
  install -Dm644 "${srcdir}/metamask/builds/metamask-firefox-${pkgver}.zip" \
                 "${extensions_dir}/webextension@metamask.io.xpi"
}
