# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=paymo-widget
pkgver=7.2.8
pkgrel=1
pkgdesc="An app that allows you to track work time via a stopwatch or manually add bulk time for paymo"
arch=('x86_64')
url="https://www.paymoapp.com/download/"
license=(proprietary)
source=("paymo-widget-${pkgver}-x86_64.AppImage::https://downloads.paymoapp.com/widget?os=linux" "paymo-widget")
sha512sums=('20baada3d79c62c13905ef2e6a358ae4d6c51fd93997aea910d8815b26a2c7003df47708a91c0fb0ba5b9039238cd06d7ea6a0cfba6744dcc39070da255000d0' '8989c0985cf8fcc2c73ae731ff60c733be6ab99ff9fa00ed31433aa0ed5c7e6b27162e3d7e578207a82cff6df8e50cdc46cef6626d47235cc76d916279a59698')

prepare() {
  chmod +x "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage
}

package() {
  "$srcdir"/paymo-widget-${pkgver}-x86_64.AppImage --appimage-extract

  cd squashfs-root
  mkdir -p "$pkgdir"/opt/$pkgname
  mkdir -p "$pkgdir"/usr/bin

  # Install files
  cp -r usr/share "$pkgdir"/usr/share
  cp -r *.so AppRun paymo-widget paymo-widget-noloader resources locales *.dat *.bin *.pak "$pkgdir"/opt/$pkgname
  install -Dm644 paymo-widget.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install launcher script that sets some required environment vars
  cp "$srcdir"/paymo-widget "$pkgdir"/usr/bin/$pkgname

  # Make desktop file use our launcher script 
  sed -i "s:Exec=AppRun:Exec=/usr/bin/$pkgname:" "$pkgdir"/usr/share/applications/$pkgname.desktop

  find "$pkgdir"/usr/share -type d -exec chmod 755 {} \;
  find "$pkgdir"/opt -type d -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
