# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
pkgname=cro-chain-desktop
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.5.6
pkgrel=2
arch=('x86_64')
makedepends=('git' 'yarn' 'nodejs<16')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop-bin')
_pkgfolder=${_pkgbin}-${pkgver}
source=(
  "${_pkgfolder}.tar.gz::https://github.com/crypto-com/chain-desktop-wallet/archive/refs/tags/v${pkgver}.tar.gz"
  "chain-desktop-wallet.desktop"
)
sha512sums=('a9e3211c63d73d4288e594422750e48a2c68b868c9b647eafbf7fd90a8d02e4c302baa436a2c9159fe332ee2605869a747477a31733d895ebf94ac8572e6f0fc'
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
