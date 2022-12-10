# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

# I updated to v2.51.0 but LedgerHQ reverted release and deleted tag.
# You should manually set pkgver=2.50.1 and set _gitrev=c5aba7d153e07729c478b159a895f3bc51d89e1d, can check git hash with command: git rev-parse @ledgerhq/live-desktop@2.50.1

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.51.0
pkgrel=3
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev')
makedepends=('git' 'python>=3.5' 'node-gyp' 'fnm' 'pnpm')
_gitrev=e0e5bb6ac602e121d3b02494323ddbe680e13bf7
_gitdir=${pkgname}-git
source=("${_gitdir}::git+${url}.git#tag=@ledgerhq/live-desktop@${pkgver}")
sha512sums=('SKIP')

_check_git_rev() {
  curr_gitrev=$(git rev-parse "@ledgerhq/live-desktop@${pkgver}")
  if [[ "${curr_gitrev}" != "${_gitrev}" ]]; then
    echo "Using the wrong git revision! Expected [${_gitrev}] but using [${curr_gitrev}]"
    exit 1
  fi
}

prepare() {
  cd "${_gitdir}"
  _check_git_rev

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_gitdir}"

  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  cd "${_gitdir}/apps/${_pkgbin}"

  install -Dm644 "dist/__appImage-x64/${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "dist/linux-unpacked/." "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  for i in 128 256 512 1024; do
    install -Dm644 "build/icons/icon@${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbin}.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
