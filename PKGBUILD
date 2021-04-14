# Maintainer: hotfloppy <hotfloppy . 6866 at gmail dot com>

pkgname=breaktimer-appimage
pkgver=ver.auto.update
pkgrel=0
pkgdesc="Save yourself from RSI and eye-strain."
arch=('x86_64')
url="https://breaktimer.app/"
license=('GPLv3')
provides=('breaktimer')
conflicts=('breaktimer-bin')
source=("https://github.com/tom-james-watson/breaktimer-app/releases/latest/download/BreakTimer.AppImage")
sha512sums=('fd3c93d78d7e33119a81bbf8cdf74ca7f4ca95efce35a4e01e844c3196a6d3ce2617ed86a9fdf10c0fd60047f1b6ac9470a20489101467995196adcc40d93dc1')
options=(!strip)
_filename=BreakTimer.AppImage

package() {
  chmod +x $_filename
  ./$_filename --appimage-extract
  INSTALL_PATH="/opt/appimages/${_filename}"
  sed -i -E "s|Exec=AppRun|Exec=${INSTALL_PATH}|" squashfs-root/breaktimer.desktop

  # install icons
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
  chmod -R 755 "$pkgdir/usr/share/icons"
  find "$pkgdir/usr/share/icons" -type f -name "breaktimer.png" -exec chmod 644 {} \;

  # install .desktop file and image file
  install -Dm644 "squashfs-root/breaktimer.desktop" "$pkgdir/usr/share/applications/breaktimer.desktop"
  install -Dm755 "$_filename" "$pkgdir$INSTALL_PATH"

  # disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "$pkgdir/usr/share/appimagekit"
  touch "$pkgdir/usr/share/appimagekit/no_desktopintegration"
  chmod 644 "$pkgdir/usr/share/appimagekit/no_desktopintegration"

}
