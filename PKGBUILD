# Maintainer: Serge K <serge.arch@zmail.pro>

# https://github.com/phnx47/pkgbuilds

_pkgbin=ledger-live-desktop
pkgname=ledger-live-git
pkgdesc="Ledger Live - Desktop (Git version)"
pkgver=2.43.1
pkgrel=1
arch=('x86_64')
url='https://github.com/LedgerHQ/ledger-live'
license=('MIT')
depends=('ledger-udev')
makedepends=('git' 'pnpm' 'ruby-bundler' 'python' 'nodejs>=12')
provides=('ledger-live')
conflicts=('ledger-live-bin' 'ledger-live')
source=("$pkgname::git+$url#branch=main" 
  "$_pkgbin.desktop")
sha512sums=('SKIP'
  '01bee3b5a90d9a87bb8b1f8edd8fa5851b39db7f9374d0e31114301876fafbc9226b120f114b66a3158a4e98eb514569f34cd0d4f1212062a55d0c8d0e698dda')

build() {
  cd $pkgname
  export GIT_REVISION=$pkgver
  export JOBS=max
  pnpm i
  pnpm build:lld:deps
  pnpm desktop dist
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd $pkgname/apps/$_pkgbin/

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

pkgver() {
  cd $pkgname/apps/$_pkgbin/
  cat package.json |
    grep version |
    head -1 |
    awk -F: '{ print $2 }' |
    sed 's/[",]//g' |
    tr -d '[[:space:]]'
}
