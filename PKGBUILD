# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_appname=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
_electron='electron19'
_sha='7a029dcdd3339303967d96a780d9b8596fc7a766'
_short_sha="${_sha::7}"
pkgver=1.4.6
pkgrel=1
arch=('x86_64')
_gh_owner='crypto-com'
_gh_repo='chain-desktop-wallet'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('Apache')
depends=("${_electron}")
makedepends=('yarn' 'fnm')
source=("${_appname}-${pkgver}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_appname}.desktop"
        "${_appname}.sh")
sha512sums=('d5f5a9add65dabe994675b25b1b8a010a04eadaab7f42e38b5e13a03a950461792d43dded091558ebfaabba1be32a69007c26781664a83db89020b459e1474ee'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a'
            'ed69cea003c265da10b205a96423a00efc508d29b0ae82a628aa1aca36f76ddc95adcb89150b2f2205d076f5f3189cfbe5a729c034186026105648720ff39960')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

prepare() {
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  _fnm_use

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
