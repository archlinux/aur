# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=Sia-UI
pkgver=1.4.10
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://sia.tech/releases/Sia-UI-${_pkgver}.AppImage"
	"https://raw.githubusercontent.com/NebulousLabs/Sia-UI/master/LICENSE")
sha512sums=('a3381650ec9e4aa0321b7277ce52199eefee39c39f37a2a28b9ee8c6f5b7b70b0ccd6f0f76a1f2eff17d722c7646e87ffb72703f8f218cd1eb089bf459ca1e1c'
            'da77523b36551334730d2be5e2b11935aa180db47dc703dcc9bd899269cd205f2205a406ff582cf8aa2fec2bae90442edcc2ef10aab341ce68e662b8137e98e3')


prepare() {
  chmod u+x ${srcdir}/Sia-UI-${_pkgver}.AppImage

  ${srcdir}/Sia-UI-${_pkgver}.AppImage --appimage-extract
}

package() {
  cd squashfs-root

  # install icons
  for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "usr/share/icons/hicolor/$size/apps/sia-ui.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/sia-ui.png"
  done

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

