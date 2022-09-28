# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.48.0
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev')
makedepends=('pnpm' 'ruby-bundler' 'python>=3.5' 'nodejs>=16')
provides=('ledger-live')
conflicts=('ledger-live-bin' 'ledger-live-git')
_pkgfolder=ledger-live--ledgerhq-live-desktop-${pkgver}
source=(
  "${_pkgbin}-${pkgver}.tar.gz::https://github.com/LedgerHQ/ledger-live/archive/refs/tags/@ledgerhq/live-desktop@${pkgver}.tar.gz"
  "ledger-live-desktop.desktop")
sha512sums=('ac60c2a606299b668205f8a36876b8aba4f4f38580df531e902ae15d9c02210d4ad22a86e0f3030dba6e37dce9c28f42edb3a51ad41567baa9ed4211aa648944'
            '01bee3b5a90d9a87bb8b1f8edd8fa5851b39db7f9374d0e31114301876fafbc9226b120f114b66a3158a4e98eb514569f34cd0d4f1212062a55d0c8d0e698dda')

build() {
  cd $_pkgfolder
  export GIT_REVISION=$pkgver
  export JOBS=max
  pnpm i --filter="ledger-live-desktop..." --filter="ledger-live" --frozen-lockfile --unsafe-perm
  pnpm build:lld:deps
  pnpm desktop build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd $_pkgfolder/apps/$_pkgbin/

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@1024x1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
