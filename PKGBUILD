# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.6.8
pkgrel=1
arch=('x86_64')
makedepends=('git' 'yarn' 'nodejs<16')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop-bin')
_pkgfolder=${_pkgbin}-${pkgver}
source=(
  "${_pkgfolder}.tar.gz::https://github.com/crypto-com/chain-desktop-wallet/archive/refs/tags/v${pkgver}.tar.gz"
  "chain-desktop-wallet.desktop"
)
sha512sums=('57cb7aaca0ab8f1346b289e0d5ecf4cc0348814eeb0ccab17e81e353229b4cf5af278c60727d0509636103e6a8974600b7c2a202ec09d4532f58e96265e3767c'
            'b5e9f80e5723c252ecb0cbf8dfd3689f56f937ab44186d64fea373c51de6ba5ac91f14dd9e04d1df452a9ee2296c34e4ec44bbdb9594eb113b8ab179d274141e')

build() {
  cd $_pkgfolder

  yarn install
  yarn electron:build
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd $_pkgfolder

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
