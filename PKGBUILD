# Maintainer: MohammadReza Palide <mrpalide@gmail.com>
pkgname=gap-messenger
pkgver=4.5.18
pkgrel=1
pkgdesc="Gap messenger, Beyond Communication"
arch=('x86_64')
url="https://www.gap.im"
license=(proprietary)
source=("gap-${pkgver}-x86_64.AppImage::https://desktop.gap.im/upgrade/gap.AppImage")
sha512sums=('891ae9a7949e705ed2e0972ac39ee84e829d716dcc022cf5e6d37c9d91620bdf968d36d6652452aefe0f3addee5057fe92200abb2788be6fdf54027268cbab6e')

prepare() {
  chmod +x "$srcdir"/gap-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/gap-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin

  # Install files
  cp -r usr/share "$pkgdir"/usr/share
  cp -r *.so AppRun gap chrome-sandbox resources locales *.dat *.bin *.pak *.png *.json "$pkgdir"/opt/$pkgname
  install -Dm644 gap.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install launcher script that sets some required environment vars
  cp gap "$pkgdir"/usr/bin/$pkgname

  # Make desktop file use our launcher script 
  sed -i "s:Exec=AppRun:Exec=/usr/bin/$pkgname:" "$pkgdir"/usr/share/applications/$pkgname.desktop

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}