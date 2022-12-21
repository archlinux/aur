# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-electron-wallet
pkgdesc="Oxen electron GUI wallet"
pkgver=1.8.1
pkgrel=1
arch=('x86_64')
url='https://github.com/oxen-io/oxen-electron-gui-wallet'
license=('BSD')
depends=('oxen-core-bin>=10.2.1')
makedepends=('node-gyp' 'fnm')
_extdir=oxen-electron-gui-wallet-${pkgver}
source=("${_extdir}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha512sums=('39bbdb79852d45df71971081224ce0cfa0fbd9886d1be8d4b3f01e2f8a0e1d388024c78c2a48ff8a1d10c6b5d541ecf87bbb94425c7caf5c9f2485e297d28518'
            '6296267d0b4d05c9f805cd03366ee87da956212755af4fedd6117ab42792ba6036842f184cb91e60e0e522f9d8e857cd5ad941c10aa62d6c850d3c0da41387b8')

build() {
  cd "${_extdir}"

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
  npm ci
  npm run build
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_extdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "dist/electron/Packaged/linux-unpacked/." "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # installed by oxen-core package
  mkdir -p "${pkgdir}/opt/${pkgname}/resources/bin"
  ln -s "$(which oxend)" "${pkgdir}/opt/${pkgname}/resources/bin/oxend"
  ln -s "$(which oxen-wallet-rpc)" "${pkgdir}/opt/${pkgname}/resources/bin/oxen-wallet-rpc"

  install -Dm644 "public/oxen-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
