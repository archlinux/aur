# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor:  Serge K <arch@phnx47.net>

pkgname=ledger-live
pkgver=2.9.0
pkgrel=1
pkgdesc="Open source companion app for your Ledger devices"
arch=('x86_64')
url="https://www.ledgerwallet.com/live"
license=('MIT')
makedepends=(yarn python nodejs-lts-erbium)

source=("https://github.com/LedgerHQ/ledger-live-desktop/archive/v${pkgver}.tar.gz"
        "ledger-live.desktop")
sha512sums=('234368d4b8624c37abb877ad92233098c4bd042685ef62a4764b296d9a7e79b29b7b20d72d194dc6c84a3a446ab4c6385b50f7df05e2d05637cff3e82bdc4371'
            '282faf948b4ab1204f61d838e8362c398ffa731533c75f2b42056a53b939255de89b82e4a9553c161874694f27089070217e56cad18a258e0b18796ab4722955')
# TODO sign with ledger pgp
validpgpkeys=()

extractedFolder=ledger-live-desktop-$pkgver

prepare() {
  cd $extractedFolder
  export JOBS=max
  yarn --ignore-scripts
}

build() {
  cd $extractedFolder
  export GIT_REVISION=$pkgver
  export JOBS=max
  yarn dist
}

package() {
  install -D -m644 \
    "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd $extractedFolder

  install -dm755 "${pkgdir}/opt"
  cp -r "dist/linux-unpacked" "${pkgdir}/opt/ledger-live"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ledger-live-desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 \
    "build/icons/icon@4x.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ledger-live.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
