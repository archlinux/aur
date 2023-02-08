# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.53.1
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev')
makedepends=('python>=3.5' 'node-gyp' 'fnm' 'pnpm')
_extdir=ledger-live--ledgerhq-live-desktop-${pkgver}
source=("${_pkgbin}-${pkgver}.tar.gz::https://github.com/LedgerHQ/ledger-live/archive/refs/tags/@ledgerhq/live-desktop@${pkgver}.tar.gz")
sha512sums=('09404f33b50a920d4c2130c585f6af7fceadb084d8ff1d3bc425ddea8f7904dec5eeb2f596abb10e55b0bb5c057ec6b84b34016751af1759da890f27c528ea74')

prepare() {
  cd "${_extdir}"

  eval "$(fnm env --shell bash)"
  fnm use --install-if-missing
}

build() {
  cd "${_extdir}"

  export GIT_REVISION=${pkgver}
  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build

  # Correct .desktop
  sed -e "s/AppRun --no-sandbox/${_pkgbin}/g" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
  sed -e "/X-AppImage-Version/d" -i "apps/${_pkgbin}/dist/__appImage-x64/${_pkgbin}.desktop"
}

package() {
  cd "${_extdir}/apps/${_pkgbin}"

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
