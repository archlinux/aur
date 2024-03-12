# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_appname=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
_electron='electron19'
_sha='b1ead085a6afa85f70dd8f334f0bdfc3259d2575'
_short_sha="${_sha::7}"
pkgver=1.5.0
pkgrel=1
arch=('x86_64')
_gh_owner='crypto-com'
_gh_repo='chain-desktop-wallet'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('Apache')
depends=("${_electron}")
makedepends=('yarn' 'nvm')
source=("${_appname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_appname}.desktop"
        "${_appname}.sh")
sha512sums=('b7d0f979320736456d98b7333be2665edbd7f6e45f9be54e8308286e7a46ae32404772b00d03a414e95a4e6a2b0a56968dbe0d2e91532673326fe5297e711d7f'
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
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"
  _nvm_install
  yarn install --frozen-lockfile
  yarn electron:build
}

package() {
  install -Dm 644 "${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"
  install -Dm 644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
}
