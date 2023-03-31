# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-electron-wallet
pkgdesc="Oxen electron GUI wallet"
pkgver=1.8.1
pkgrel=2
arch=('x86_64')
url='https://github.com/oxen-io/oxen-electron-gui-wallet'
license=('BSD')
depends=('oxen-core-bin>=10.2.1' 'electron4')
makedepends=('node-gyp' 'fnm')
_extdir=oxen-electron-gui-wallet-${pkgver}
source=("${_extdir}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha512sums=('39bbdb79852d45df71971081224ce0cfa0fbd9886d1be8d4b3f01e2f8a0e1d388024c78c2a48ff8a1d10c6b5d541ecf87bbb94425c7caf5c9f2485e297d28518'
            '6296267d0b4d05c9f805cd03366ee87da956212755af4fedd6117ab42792ba6036842f184cb91e60e0e522f9d8e857cd5ad941c10aa62d6c850d3c0da41387b8'
            'fe65eb02d62a3e8ef404514cd911d3d94bf361b8231767551444c40004aea48ac56e4a5f234b1f819c0b5f7066619f1158c2749d23b60999a7c4e57b41903605')


_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

_check_nodejs() {
  exp_ver=v$(cat .nvmrc)
  use_ver=$(node -v)
  if [[ "${exp_ver}" != "${use_ver}" ]]
  then
    echo "Using the wrong version of NodeJS! Expected [${exp_ver}] but using [${use_ver}]."
    exit 1
  fi
}

build() {
  cd "${_extdir}"

  _fnm_use
  _check_nodejs

  npm ci
  npm run build
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_extdir}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/bin"
  cp -r "dist/electron/Packaged/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"
  # installed by oxen-core package
  ln -s "$(which oxend)" "${pkgdir}/usr/lib/${pkgname}/bin/oxend"
  ln -s "$(which oxen-wallet-rpc)" "${pkgdir}/usr/lib/${pkgname}/bin/oxen-wallet-rpc"

  install -Dm644 "public/oxen-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
