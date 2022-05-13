# Maintainer: Serge K <serge.arch@zmail.pro>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.org Chain desktop wallet (AppImage version)'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.7.8
pkgrel=1
arch=('x86_64')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop')
_pkgsrc="chain-desktop-wallet-${pkgver}-${arch}.AppImage"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/crypto-com/chain-desktop-wallet/v${pkgver}/LICENSE"
)
sha512sums=('b167fe4d667640bba32ac233b990e1f53f92645a61bae00793736c5a33ce173735ae92ceb041ed51ce5e29624beeed26c3a3cd72f0363ffcb53afb3fa2be4ab3'
            '1a75d1990776c2c5cbc25b0d6381a67082c48ec3e7f18a4ad66caf55987548e5a622c1c8e330a1efaaf74e9c71aaad6d5a260062b50c5df9b26352c8efc6dd47')

build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract

  # Correct .desktop, icon
  mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
  install -d "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgname/"
  rm -rf "${pkgdir}/opt/${_pkgname}/usr/share"
  rm -f "${pkgdir}/opt/${_pkgname}/chain-desktop-wallet.png"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
