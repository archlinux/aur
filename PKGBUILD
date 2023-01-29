# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.52.0
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev')
makedepends=('python>=3.5' 'node-gyp' 'fnm' 'pnpm')
_extdir=ledger-live--ledgerhq-live-desktop-${pkgver}
source=("${_pkgbin}-${pkgver}.tar.gz::https://github.com/LedgerHQ/ledger-live/archive/refs/tags/@ledgerhq/live-desktop@${pkgver}.tar.gz")
sha512sums=('7a655ae6831eed56fecb4d46e2d7af7610a60beb194e8e451f7e5d1c16b16734449c0cdc15dfea40f66f112baa31100bf6fb1f5fed51d6c5c6e4afdc31cdb4a7')

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
