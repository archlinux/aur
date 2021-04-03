# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.1.4
pkgrel=1
arch=('x86_64')
package="chain-desktop-wallet-${pkgver}-${arch}.AppImage"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
  "LICENSE"
)
sha512sums=('4146ab217968e40a2da859f3f83bfb2b7f680b465913af8d62165ee8e440c0e3a06086825e09e8024f8a8ad2804b6dd7b9a0153248aba61fdfe78d012cd53516'
            'cd660ca9bc594ae6476c54e50d49c7e886c2f7dbaffb1876ef866c4a6dd219f734996f42361a4d958688b04e3b6188f0384bcf0690060a1e46306448bb70ca09')

build() {
  # Extract files
  chmod +x "$srcdir/$package"
  $srcdir/$package --appimage-extract

  # Correct .desktop, icon
  mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
  install -d "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgname/"
  rm -rf "${pkgdir}/opt/${_pkgname}/usr/share"
  rm -f "${pkgdir}/opt/${_pkgname}/chain-desktop-wallet.png"
  chmod -R +rx "$pkgdir/opt/$_pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
