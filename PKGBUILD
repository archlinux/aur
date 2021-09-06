# Maintainer: Jimin Kim <developomp@gmail.com>

pkgname='krunker'
pkgver='2.1.3'
pkgrel=1

pkgdesc="A free Multiplayer Online Game. No Download needed."
arch=('x86_64')
license=('custom') # https://krunker.io/docs/terms.txt
url='https://krunker.io'
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

depends=()
makedepends=()

source=(
  'https://client2.krunker.io/setup.AppImage'
  'terms.txt'
  'krunker'
)

sha256sums=(
  'SKIP'
  'f1181c174d40d8f38117dc86a498df1db45ccd52ee0d0c3028be7a8c8b5560cc'
  '3226cb60d743aab6f1704d08ee9e581c526a91c6b44cd0162324f6e4c1e2b7e5'
)

_filename=krunker.AppImage

package() {
  # Change filename from setup.AppImage to krunker.AppImage
  mv "setup.AppImage" $_filename

  chmod +x $_filename
  mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
  ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/io.krunker.desktop.png" > /dev/null 2>&1
  ./$_filename --appimage-extract io.krunker.desktop.desktop > /dev/null 2>&1
  INSTALL_PATH="/opt/appimages/$_filename"
  sed -i -E "s|Exec=AppRun|Exec=$INSTALL_PATH|" squashfs-root/io.krunker.desktop.desktop
  sed -i -E "s|Icon=io.krunker.desktop|Icon=/usr/share/icons/hicolor/0x0/apps/io.krunker.desktop.png|" squashfs-root/io.krunker.desktop.desktop

  # install icons
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
  chmod -R 755 "$pkgdir/usr/share/icons"
  find "$pkgdir/usr/share/icons" -type f -name "io.krunker.desktop.png" -exec chmod 644 {} \;

  # install .desktop file and image file
  install -Dm644 "squashfs-root/io.krunker.desktop.desktop" "$pkgdir/usr/share/applications/krunker.desktop"
  install -Dm755 "$_filename" "$pkgdir$INSTALL_PATH"

  # install license file
  install -Dm644 "terms.txt" "$pkgdir/usr/share/licenses/krunker/terms.txt"

  # disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "$pkgdir/usr/share/appimagekit"
  touch "$pkgdir/usr/share/appimagekit/no_desktopintegration"
  chmod 644 "$pkgdir/usr/share/appimagekit/no_desktopintegration"

  # Launch script
  mkdir -p "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/krunker" "$pkgdir/usr/bin/krunker"
}
