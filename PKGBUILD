# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
_pkgname=ledger-live
pkgname="${_pkgname}-git"
pkgdesc="Maintain your Ledger devices (git-main)"
pkgver=2.62.2.r0.g0a331c7
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' 'electron23')
makedepends=('git' 'node-gyp' 'fnm' 'pnpm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}#branch=main"
        "${_pkgbin}.sh")
sha512sums=('SKIP'
            '15f6703121d1f2df2dab494efd645ef27830b5cff41184483c75a21545d79b183ababb47bebc8571c7f77e562497efc2453c3e41b59e40ad03be2baacf20148e')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  version="$(awk -F "=" '/node/ {print $2}' .prototools | xargs)"
  fnm use "${version}" --install-if-missing
}

build() {
  cd "${pkgname}"

  _fnm_use

  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  install -Dm 755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${pkgname}/apps/${_pkgbin}"

  install -Dm 644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"
  install -Dm 755 "dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgbin}"

  install -Dm 644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm 644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 --match '@ledgerhq/live-desktop@*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -d@ -f3
}
