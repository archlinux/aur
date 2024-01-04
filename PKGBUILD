# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_appname=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Maintain your Ledger devices"
_electron='electron27'
_sha='81cfae079c111a79c77ac9a8a637a7d595f19ab0'
_short_sha="${_sha::7}"
pkgver=2.73.1
pkgrel=1
arch=('x86_64')
_gh_owner='LedgerHQ'
_gh_repo='ledger-live'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('MIT')
depends=('ledger-udev' "${_electron}")
makedepends=('node-gyp' 'fnm' 'pnpm')
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_appname}.sh")
sha512sums=('902a0ad4aa08adfca04d9eeed61792ae3c7d12f80d11fb1d1a5373bd24ed0b13aba6774bab7d61d8cc808e4323e741385f2e52c488647396feaf70b3df7763dc'
            '70effe952d7007e79e43523f5e8d868228eedb5049465c2ebea017f9c8b0b25f82e0c6f56cef59e40479d29149969cde8e7098edf8a0cad7b23a9a123e5f0755')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  version="$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
  fnm use "${version}" --install-if-missing
}

prepare() {
  sed -i "s~@ELECTRON@~${_electron}~" "${_appname}.sh"
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  _fnm_use

  export GIT_REVISION="${pkgver}"
  pnpm i --filter="${_appname}..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_appname}/g" -i "apps/${_appname}/dist/__appImage-x64/${_appname}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_appname}/dist/__appImage-x64/${_appname}.desktop"
}

package() {
  install -Dm 755 "${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}/apps/${_appname}"

  install -Dm 644 "dist/__appImage-x64/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_appname}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_appname}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
