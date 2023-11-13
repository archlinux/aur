# Maintainer: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=8.4.1
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
b2sums=('32d57cd81e74a2769b64a0b5948e1f6089261e079d00b0b533d9769e4e2ae610af2e3eaff51b1385b798f7ca171cb18bc4e11ca8ecc0c47e82d30de4eb2ff132'
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
