# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Maintain your Ledger devices"
pkgver=2.71.1
pkgrel=1
arch=('x86_64')
_gh_owner='LedgerHQ'
_gh_repo='ledger-live'
url="https://github.com/${_gh_owner}/${_gh_repo}"
license=('MIT')
depends=('ledger-udev' 'electron27')
makedepends=('node-gyp' 'fnm' 'pnpm')
_sha='a184eea5566f9a03f53e82f12c18fe8fb890bd52'
_short_sha="${_sha::7}"
source=("${pkgname}-${pkgver}-${_short_sha}.tar.gz::https://api.github.com/repos/${_gh_owner}/${_gh_repo}/tarball/${_sha}"
        "${_pkgbin}.sh")
sha512sums=('c4c683a5fce827a319a49e99f26c3ac4df1c14602ac498e2cf9d0d4377a2dc0a681f221fefa0c4f1c7674604d5a98102349c590068c8936422492952c57a1d87'
            '9ff546c1becdc64fdb90fde4813386e95da97354a261530a13df7cc4d860e3cac15e65b5abd3e135e1e791d7af643cb6b684eb8a593e4641fba60619dcc9c346')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  version="$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
  fnm use "${version}" --install-if-missing
}

build() {
  cd "${_gh_owner}-${_gh_repo}-${_short_sha}"

  _fnm_use

  export GIT_REVISION="${pkgver}"
  pnpm i --filter="${_pkgbin}..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  install -Dm 755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${_gh_owner}-${_gh_repo}-${_short_sha}/apps/${_pkgbin}"

  install -Dm 644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgbin}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
