# Maintainer: Trustin Lee <t@motd.kr>

pkgname=focusatwill-appimage
pkgver=2.0.0
pkgrel=1
pkgdesc="Focus@Will combines neuroscience and music to boost productivity."
provides=('focusatwill')
conflicts=('focusatwill')
arch=('x86_64')
url="https://focusatwill.com/"
options=(!strip)
_desktop_name=focusatwill.desktop
_filename=focusatwill-${pkgver}.AppImage
source=(
  https://faw-desktop.s3.amazonaws.com/${_filename}
)
sha512sums=('af50f014738ae2128fd219ed5783da5a33bc82f272c60de14d93f70f1e55fe0b54ea133e223610e8456153c585357a0acb6202463f54b7d793e8b6b771a18d6d')


prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/focusatwill.AppImage --disable-seccomp-filter-sandbox|" squashfs-root/${_desktop_name}
}

package() {
  echo "Starting install"
  install -Dm755 $_filename "$pkgdir"/usr/bin/focusatwill.AppImage
  echo "Installing desktop launch file to $pkgdir/usr/bin/focusatwill.AppImage"
  install -Dm755 squashfs-root/${_desktop_name} "$pkgdir"/usr/share/applications/${_desktop_name}
  echo "Installing icons"
  for res in "16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
    install -Dm644 squashfs-root/usr/share/icons/hicolor/$res/apps/focusatwill.png $pkgdir/usr/share/icons/hicolor/$res/apps/focusatwill.png
  done
}
