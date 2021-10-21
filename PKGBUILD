# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Felix Golatofski <contact@xdfr.de>

# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live
pkgdesc="Ledger Live - Desktop"
pkgver=2.34.3
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live-desktop'
license=('MIT')
depends=('ledger-udev')
makedepends=('git' 'yarn' 'python' 'nodejs>=12')
provides=('ledger-live')
conflicts=('ledger-live-bin' 'ledger-live-git')
source=("https://github.com/LedgerHQ/ledger-live-desktop/archive/v${pkgver}.tar.gz"
        "ledger-live-desktop.desktop")
sha512sums=('a41424f60ec2322287128af0f8bc624f7cd1fbeb9702ac44edc5ceace3cd7efc916cf4187d7f26b7f2574cd844f14b4398da5529cfb943fc3dc1a4c30239ce4e'
            '01bee3b5a90d9a87bb8b1f8edd8fa5851b39db7f9374d0e31114301876fafbc9226b120f114b66a3158a4e98eb514569f34cd0d4f1212062a55d0c8d0e698dda')

extracted_folder=ledger-live-desktop-$pkgver

prepare() {
  cd $extracted_folder
  export JOBS=max
  yarn --ignore-scripts
}

build() {
  cd $extracted_folder
  export GIT_REVISION=$pkgver
  export JOBS=max
  yarn dist
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd $extracted_folder

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgbin}.png"  
  install -Dm644 "build/icons/icon@512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
  install -Dm644 "build/icons/icon@1024x1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbin/LICENSE"
}
