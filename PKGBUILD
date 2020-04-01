# Maintainer: Meriadec Pillet <meriadec.pillet@gmail.com>
# shellcheck disable=SC2154,SC2034,SC2164

pkgname=ledger-live
pkgver=2.1.0
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
sha512sums=('81c66645fdf2127160fc981813bfdc7603dd8b9daa97b3113425a170b63e80aa5804705bbeeae72f636ea065798448c8d2db245efa0f7b2f05e661312775211a'
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
