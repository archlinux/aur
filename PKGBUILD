# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=10.0.0
pkgrel=1
_nodeversion=12.18.3
pkgdesc="Cross-platform HTTP and GraphQL Client"
url="https://github.com/Kong/insomnia"
arch=('any')
license=('MIT')
depends=()
makedepends=('npm' 'nvm' 'fontconfig' 'yarn')
source=(
  "https://github.com/Kong/insomnia/archive/refs/tags/core@${pkgver}.tar.gz"
  "insomnia.desktop"
)
b2sums=('d41b3af1ee0aa1e2bb139f7e6b236e28bafeccb4b74a76c6f62cf736fa3c4c6ec6384e34745a2d2f24b953a285f75d3d3caaf33e9c6c982ebbd435f76bf35121'
        '38c2edd681b012931e25498a4a65007cc2a2152c9bbc5505dbb7cf03e1143a7365c41e9ad7eb2318c8ea894dccad0e0b6601cf76f680ea4085d12b5059e61a6e')

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${pkgname}-core-${pkgver}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  cd ${pkgname}-core-${pkgver}
  nvm install
}

build() {
  _ensure_local_nvm
  cd ${pkgname}-core-${pkgver}
  npm install

  export GIT_TAG="core@${pkgver}"
  export NODE_OPTIONS="--max-old-space-size=4096"

  npm run package --workspace=packages/insomnia -- --linux dir
}

package() {
  cd ${pkgname}-core-${pkgver}

  install -dm755 "${pkgdir}/opt/insomnia"

  cp -r packages/insomnia/dist/linux-*unpacked/. "${pkgdir}/opt/insomnia"

  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 packages/insomnia/src/ui/images/insomnia-logo.svg "${pkgdir}/usr/share/pixmaps/insomnia.svg"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
