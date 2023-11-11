# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

pkgname=oxen-electron-wallet
pkgdesc="Oxen electron GUI wallet"
pkgver=1.8.1
pkgrel=4
arch=('x86_64')
_gh_owner='oxen-io'
_gh_repo='oxen-electron-gui-wallet'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('BSD')
depends=('oxen-core-bin' 'electron4')
makedepends=('node-gyp' 'python310' 'fnm')
_sha='709008c8bc7d72332ce60a3ce03d00eb239367a5'
_short_sha="${_sha::7}"
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha512sums=('988ca20aae8c824a081ba5706b25c05b1ba00bbdb1adb33c82aa287c0007b361b64b236ae991dc3ba0b93156649db92ff3eca10440233959123991b870638f81'
            '6296267d0b4d05c9f805cd03366ee87da956212755af4fedd6117ab42792ba6036842f184cb91e60e0e522f9d8e857cd5ad941c10aa62d6c850d3c0da41387b8'
            'fe65eb02d62a3e8ef404514cd911d3d94bf361b8231767551444c40004aea48ac56e4a5f234b1f819c0b5f7066619f1158c2749d23b60999a7c4e57b41903605')


_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  _fnm_use

  export NODE_GYP_FORCE_PYTHON=python3.10

  npm ci
  npm run build
}

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}/bin"
  cp -r "dist/electron/Packaged/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}"
  # installed by oxen-core package
  ln -s "$(which oxend)" "${pkgdir}/usr/lib/${pkgname}/bin/oxend"
  ln -s "$(which oxen-wallet-rpc)" "${pkgdir}/usr/lib/${pkgname}/bin/oxen-wallet-rpc"

  install -Dm644 public/oxen-logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
