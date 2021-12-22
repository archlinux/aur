# Maintainer kyle[at]kylemanna[d0t]com
_pkgbin=celoterminal
pkgname=${_pkgbin}-bin
pkgdesc='Celo Terminal (AppImage version)'
license=('MIT')
url='https://github.com/zviadm/celoterminal'
pkgver=1.11.8
pkgrel=2
arch=('x86_64')
provides=('celoterminal')
conflicts=('celoterminal')
depends=('libusb')

_pkgsrc="Celo-Terminal-${pkgver}-linux-x86_64.AppImage"

source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/zviadm/celoterminal/v${pkgver}/LICENSE"
)
sha512sums=('8870d7558a05d993bcaabde9802397b772b288b3e7fc56c57b4bbec8e1784a664816245a27646181dd8429d85b27fe54ee7b95230d370557ce1f5b7047f8a857'
            'a731d9fb18452044870d02b527f20daff536330404d4c9fb30fa3c8970dbd179b7d03ef4eed02b78ed1c6c75f5fcf19b018b533e86d8c3be6c034c3170106a6a')

build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract
}


package() {
  cd $srcdir/squashfs-root

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "${_pkgbin}.desktop"

  install -d "$pkgdir/opt/$_pkgbin"
  cp -a . "$pkgdir/opt/$_pkgbin/"
  chmod -R +rx "$pkgdir/opt/$_pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  (cd $pkgdir/usr/share/licenses/$pkgname; ln -s ../../../../opt/celoterminal/LICENSE* .) 

  # Fix strange icon size
  mv "$pkgdir/usr/share/icons/hicolor/0x0" "$pkgdir/usr/share/icons/hicolor/512x512"
}
