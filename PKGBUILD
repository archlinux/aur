# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.4.1
pkgrel=6
arch=('x86_64')
depends=('electron19')
makedepends=('yarn' 'fnm')
source=("${_pkgbin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgbin}.desktop"
        "${_pkgbin}.sh")
sha512sums=('cccc235b644a232ca09d2c456d9f93a38dfaf7a184c6d5b286c32bc2e4e55d69e6d78b6356d2a279b8669fe10428642c5cc93b6ff1402f55ddd9fbbc0bb263ff'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a'
            '8be2a47ec0d4831c7bedc39a0cdbf5eee5d33df1483c2c43202cc661bce3747a14f873e2c6ca7a6e7dc0b2fac74374ede6a8b600dec576c5f8f30ce523c444bd')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

_check_nodejs() {
  exp_ver=$(cat .node-version)
  use_ver=$(node -v)
  if [[ "${exp_ver}" != "${use_ver}" ]]
  then
    echo "Using the wrong version of NodeJS! Expected [${exp_ver}] but using [${use_ver}]."
    exit 1
  fi
}

build() {
  cd "${_pkgbin}-${pkgver}"

  _fnm_use
  _check_nodejs

  yarn install --frozen-lockfile
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${_pkgbin}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
}
