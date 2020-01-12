# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-ui
_pkgname=Sia-UI
pkgver=1.4.2
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('gconf' 'gtk2' 'nss' 'libxss')
source=("https://sia.tech/releases/Sia-UI-${_pkgver}.AppImage")
sha256sums=('5727b01e0576201c17156078c99d8f8c810d5b73a682c99a4f64f3ec2212bec5')

package() {
  cd $srcdir

  # extract files
  chmod +x "Sia-UI-${_pkgver}.AppImage"
  `./Sia-UI-${_pkgver}.AppImage --appimage-extract`

  cd squashfs-root

  # install icons
  for size in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512; do
    install -Dm644 "usr/share/icons/hicolor/$size/apps/sia-ui.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/sia-ui.png"
  done

  # install resources
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  find $pkgdir/opt/$pkgname -type d -exec chmod 755 {} \;
  find $pkgdir/opt/$pkgname -type f -exec chmod 644 {} \;
  chmod -R +x $pkgdir/opt/$pkgname/resources/bin

  # link executable
  chmod +x $pkgdir/opt/$pkgname/$pkgname
  ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname

  # install desktop file
  sed -e "s/AppRun/$pkgname/g" -i $pkgname.desktop
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

