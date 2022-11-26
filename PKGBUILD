# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-electron-wallet
pkgdesc="Oxen electron GUI wallet"
pkgver=1.8.0
pkgrel=2
arch=('x86_64')
url='https://github.com/oxen-io/oxen-electron-gui-wallet'
license=('BSD-3')
depends=('oxen-core-bin')
makedepends=('node-gyp' 'fnm')
conflicts=('oxen-gui-wallet-appimage')
_extdir=oxen-electron-gui-wallet-${pkgver}
source=("${_extdir}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha512sums=('7befa6d2d90f7478af8f1c90759346b4a74b962560c23d6bb69e70e475602734b9f8af5e12d0ebb70d73387eb5392bf9cfa503ae2b9143754f152864d6542f32'
            '3833da6811538950bce3775ef0d09627683693364925b24e6ee9d6d247e9e646bf34cd90f38c73ed427132d8fb4c9aae6c8a98412ddbb959ffd926e9a3e10d6b')

build() {
  cd "${_extdir}"

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
  npm install
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
  ln -s "/usr/bin/oxend" "${pkgdir}/opt/${pkgname}/resources/bin/oxend"
  ln -s "/usr/bin/oxen-wallet-rpc" "${pkgdir}/opt/${pkgname}/resources/bin/oxen-wallet-rpc"

  install -Dm644 "public/oxen-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
