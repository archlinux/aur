# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.com DeFi Desktop Wallet'
license=('Apache')
_gh_owner='crypto-com'
_gh_repo='chain-desktop-wallet'
url="https://github.com/${_gh_owner}/${_gh_repo}"
pkgver=1.4.5
pkgrel=1
arch=('x86_64')
depends=('electron19')
makedepends=('yarn' 'fnm')
_sha='c53f4e5e52927a3ca8baace72d269ce75c1aaf75'
_short_sha="${_sha::7}"
source=("${_pkgbin}-${pkgver}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_pkgbin}.desktop"
        "${_pkgbin}.sh")
sha512sums=('ab9c5a1a0ad4a83aa1004b365a1ce22ba3b2d1aa6418afc33221a2121dcc2662d00e40351d7d357ba3b8596d7e58f23deb93f08e68b64998272f026ca5256327'
            'f7e4d91d7078a1d627995ffec39b4b67239827dbab0651909238a718ac4538bd6316c8f87430b244b13f617214171d6283ae3b1c268827b3d49f8dead5d2d71a'
            '8be2a47ec0d4831c7bedc39a0cdbf5eee5d33df1483c2c43202cc661bce3747a14f873e2c6ca7a6e7dc0b2fac74374ede6a8b600dec576c5f8f30ce523c444bd')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  _fnm_use

  yarn install --frozen-lockfile
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
}
