# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.5.4
pkgrel=1
arch=('x86_64')
_package="chain-desktop-wallet-${pkgver}-${arch}.AppImage"
source=(
  "${_package}::${url}/releases/download/v${pkgver}/${_package}"
  "LICENSE::https://raw.githubusercontent.com/crypto-com/chain-desktop-wallet/v${pkgver}/LICENSE"
)
sha512sums=('583cbabeb58efedb9a7729e65858cbaebbd32092354949145d07b4e85bbdf5e5d518ef3b0ab4399b32401d963eb5819fa28a57de157d2a6e9f003ab1fad39254'
            '1a75d1990776c2c5cbc25b0d6381a67082c48ec3e7f18a4ad66caf55987548e5a622c1c8e330a1efaaf74e9c71aaad6d5a260062b50c5df9b26352c8efc6dd47')

build() {
  # Extract files
  chmod +x "$srcdir/$_package"
  $srcdir/$_package --appimage-extract

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
