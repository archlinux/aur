# Maintainer: Václav Valíček <vaclav@valicek.name>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=siaprime-ui
_name=ScPrime-UI
pkgver=1.5.1
pkgrel=1
pkgdesc="ScPrime - Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://scpri.me"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://scpri.me/releases/${_name}-${pkgver}.AppImage"
	"https://gitlab.com/scpcorp/ScPrime/-/raw/master/LICENSE")
sha512sums=('83904d27c4db496358ced3ae1a023150d6e662fbe5069435437f1024ee5cd246089d8a51f140dabfca96e563625003b488a166b04b45a7b3f87b5efba5949abe'
            'f2eb222fff7fe71e37e2e60ed34630fbcf5464a8b05de415b346002f8b33b0a2735027649d595280f026801ba26978442b743abc54dc5451c7f8396979f5b1ae')


prepare() {
  chmod u+x ${srcdir}/${_name}-${pkgver}.AppImage

  ${srcdir}/${_name}-${pkgver}.AppImage --appimage-extract
}

package() {
  cd squashfs-root

  # install icons
  install -Dm644 "usr/share/icons/hicolor/0x0/apps/${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/${pkgname}.png"

  # install resources
  install -d "$pkgdir"/{opt/${pkgname},usr/bin}
  cp -a * "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} \;
  chmod -R +x "$pkgdir/opt/$pkgname/resources/bin"

  # link executable
  chmod +x "$pkgdir/opt/$pkgname/$pkgname"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

  # install desktop file
  sed -e "s/AppRun/$pkgname/g" -i $pkgname.desktop
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}


