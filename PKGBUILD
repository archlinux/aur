# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

# Repository for PR: https://gitlab.com/phnx47-aur/ledger-live-bin

_pkgbin=ledger-live-desktop
pkgname=ledger-live-bin
pkgdesc='Ledger Live - Desktop'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=2.24.0
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
depends=('ledger-udev')
options=(!strip)
provides=('ledger-live')
conflicts=('ledger-live')
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
  "LICENSE::https://raw.githubusercontent.com/LedgerHQ/ledger-live-desktop/v${pkgver}/LICENSE"
)
sha512sums=('f86d1ba409400fc6fbf5c3d6f12dee5078c9749b0da9269081a9b521051ffe3f51bae8897b8cd438e803bde4e7be1948458eec2765d9867b656e579522a41d8a'
            '915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318')

build() {
  # Extract files
  chmod +x "$srcdir/$package"
  $srcdir/$package --appimage-extract

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
  install -d "$pkgdir/opt/$_pkgbin"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"
  chmod -R +rx "$pkgdir/opt/$_pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
