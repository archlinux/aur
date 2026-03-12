# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=12.4.0
pkgrel=1
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
b2sums=('07b4c570eb4c642ca7d297a67a2354222993dbc212dc550f559f4b0c802510dc0fba7e8c460067a5c217c77e7cf7f170f0f5ebd6e7de9da0da0a0226eb575f80'
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
  export NODE_OPTIONS="--max-old-space-size=8192"

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
