# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
_pkgname=ledger-live
pkgname=${_pkgname}-git
pkgdesc="Ledger Live - Desktop (git-main)"
pkgver=2.57.0.r0.g76dda1b
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev' 'electron23')
makedepends=('git' 'python>=3.5' 'node-gyp' 'fnm' 'pnpm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}#branch=main"
        "${_pkgbin}.sh")
sha512sums=('SKIP'
            '15f6703121d1f2df2dab494efd645ef27830b5cff41184483c75a21545d79b183ababb47bebc8571c7f77e562497efc2453c3e41b59e40ad03be2baacf20148e')

_fnm_use() {
  export FNM_DIR="${srcdir}/.fnm"
  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

_check_nodejs() {
  exp_ver=$(cat .nvmrc)
  use_ver=$(node -v)
  if [[ "${exp_ver}" != "${use_ver}" ]]
  then
    echo "Using the wrong version of NodeJS! Expected [${exp_ver}] but using [${use_ver}]."
    exit 1
  fi
}

build() {
  cd "${pkgname}"

  _fnm_use
  _check_nodejs

  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  install -Dm755 "${_pkgbin}.sh" "${pkgdir}/usr/bin/${_pkgbin}"

  cd "${pkgname}/apps/${_pkgbin}"

  install -Dm644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  install -dm755 "${pkgdir}/usr/lib/${_pkgbin}"
  cp -r "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${_pkgbin}"

  install -Dm644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 --match '@ledgerhq/live-desktop@*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | cut -d@ -f3
}
