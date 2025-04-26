# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-desktop-wallet
pkgname=cro-chain-desktop
_electron='electron19'
pkgver=1.5.1
pkgrel=1
pkgdesc='Crypto.com DeFi Desktop Wallet'
arch=('x86_64')
url='https://github.com/crypto-com/chain-desktop-wallet'
license=('Apache')
depends=("${_electron}")
makedepends=('yarn' 'nvm')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${_appname}.desktop"
        "${_appname}.sh")
sha512sums=('33c583dd61f0ca6b0d67d0cf3c9c11a43fb32d17f55c7217e4ffaefd2ba2e8dd193fbf388dfbecb6027af6dbf9c9e2783cf827277859bd6a94549d2f9864ea75'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a'
            'ed69cea003c265da10b205a96423a00efc508d29b0ae82a628aa1aca36f76ddc95adcb89150b2f2205d076f5f3189cfbe5a729c034186026105648720ff39960')

_nvm_install() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "$(cat .node-version)"
}

prepare() {
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"
}

build() {
  cd "${_appname}-${pkgver}"
  _nvm_install
  yarn install --frozen-lockfile
  yarn electron:build
}

package() {
  install -Dm 644 "${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

  cd "${_appname}-${pkgver}"

  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"
  install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
}
