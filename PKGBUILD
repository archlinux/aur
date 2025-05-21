# Maintainer: TDD788 <thedarkdeath788@gmail.com>

pkgname=balena-etcher-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=('x86_64')
url="https://etcher.io/"
license=('Apache')
depends=('fuse2')
options=(!strip)
source=(
  "balenaEtcher-$pkgver-x64.AppImage::https://github.com/balena-io/etcher/releases/download/v$pkgver/balenaEtcher-$pkgver-x64.AppImage"
  "balenaEtcher.desktop"
)
sha256sums=(
  'd17976ac200b0379b1668b24a51ebf69124855d7dbf28f1333c446459b94147f'
  'efb53d8628196184891b8eb5a0f4c9f055e515659fa4cd9b7a7b793558262cd3'
)

prepare() {
  chmod +x "balenaEtcher-$pkgver-x64.AppImage"
  "./balenaEtcher-$pkgver-x64.AppImage" --appimage-extract
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -r squashfs-root/usr/{lib/balena-etcher/*,share} "$pkgdir/opt/$pkgname"

  # Symlink to make executable accessible system-wide
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/$pkgname/balena-etcher" "$pkgdir/usr/bin/balena-etcher"

  # Install .desktop entry
  install -Dm644 "$srcdir/balenaEtcher.desktop" "$pkgdir/usr/share/applications/balenaEtcher.desktop"

  # Optional: install icon if available in extracted AppImage
  if [[ -f "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/balena-etcher.png" ]]; then
    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/balena-etcher.png" \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/balena-etcher.png"
  fi
}

