# Maintainer: Meriadec Pillet <meriadec.pillet@gmail.com>
# shellcheck disable=SC2154,SC2034,SC2164

pkgname=ledger-live
pkgver=2.2.3
pkgrel=1
pkgdesc="Open source companion app for your Ledger devices"
arch=('x86_64')
url="https://www.ledgerwallet.com/live"
license=('MIT')
makedepends=(yarn python2)

# TODO generate changelog from release notes
changelog=

source=("https://github.com/LedgerHQ/ledger-live-desktop/archive/v${pkgver}.tar.gz"
        "ledger-live.desktop")
sha512sums=('a718460dbf89546ddda67f9ee1356ac30ab2727db98839699862a9456ab14cad8b44b3a22cf8cf62693cce31fdc8a054b39379ab8f43cc72ac25091def39ddc1'
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
    "static/images/browser-window-icon-512x512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ledger-live.png"
}
