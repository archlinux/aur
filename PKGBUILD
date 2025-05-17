# Maintainer: Serge K <arch@phnx47.net>

_reponame=oxen-electron-gui-wallet
pkgname=oxen-electron-wallet
pkgdesc="Oxen electron GUI wallet"
pkgver=1.8.3
pkgrel=1
arch=('x86_64')
url="https://github.com/oxen-io/${_reponame}"
license=('BSD-3-Clause')
depends=('oxen-core' 'electron4')
makedepends=('node-gyp' 'python310' 'nvm')
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha512sums=('887103ffd83d2b46300e91fb2b67db10e0926d49105bba8aec162766c1bee4699d9aa91e774d370b96eb4e866b75a2e1efbbb9987777814ecb07bce1ad06ca9d'
            '6296267d0b4d05c9f805cd03366ee87da956212755af4fedd6117ab42792ba6036842f184cb91e60e0e522f9d8e857cd5ad941c10aa62d6c850d3c0da41387b8'
            'fe65eb02d62a3e8ef404514cd911d3d94bf361b8231767551444c40004aea48ac56e4a5f234b1f819c0b5f7066619f1158c2749d23b60999a7c4e57b41903605')

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  export NPM_CONFIG_USERCONFIG="${srcdir}/.npmrc"
  echo "registry=https://registry.npmjs.org/" > "${NPM_CONFIG_USERCONFIG}"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install
}

build() {
  cd "${_reponame}-${pkgver}"

  _nvm_install

  export NODE_GYP_FORCE_PYTHON=python3.10

  npm ci
  npm run build
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_reponame}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/bin"
  cp -r "dist/electron/Packaged/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"
  # installed by oxen-core package
  ln -s "$(which oxend)" "${pkgdir}/usr/lib/${pkgname}/bin/oxend"
  ln -s "$(which oxen-wallet-rpc)" "${pkgdir}/usr/lib/${pkgname}/bin/oxen-wallet-rpc"

  install -Dm644 public/oxen-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
