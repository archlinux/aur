# Maintainer: pruefsumme <194605914+pruefsumme@users.noreply.github.com>
# Copyright (C) 2026 WideMelon contributors
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=widemelon-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Widescreen Nintendo DS emulator based on melonDS (AppImage)'
arch=('x86_64')
url='https://github.com/pruefsumme/widemelon'
license=('GPL-3.0-or-later')
depends=('fuse2')
provides=('widemelon')
conflicts=('widemelon' 'widemelon-git')
options=('!strip' '!debug')
_appimage="WideMelon-${pkgver}-${CARCH}.AppImage"
source=("${_appimage}::https://github.com/pruefsumme/widemelon/releases/download/v${pkgver}/${_appimage}")
sha256sums=('b371af8ba5bba146194b4e51a6ceb152a0d62471e29ffc0df73b3bdbf7b90b71')

prepare() {
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "$_appimage" \
    "$pkgdir/opt/widemelon/WideMelon.AppImage"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/widemelon/WideMelon.AppImage "$pkgdir/usr/bin/widemelon"

  install -Dm644 squashfs-root/usr/share/applications/io.github.pruefsumme.WideMelon.desktop \
    "$pkgdir/usr/share/applications/io.github.pruefsumme.WideMelon.desktop"
  install -Dm644 squashfs-root/usr/share/metainfo/io.github.pruefsumme.WideMelon.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.pruefsumme.WideMelon.metainfo.xml"
  local size
  for size in 16 32 48 64 128 256; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/io.github.pruefsumme.WideMelon.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.pruefsumme.WideMelon.png"
  done
  install -Dm644 squashfs-root/usr/share/doc/widemelon/LICENSE \
    "$pkgdir/usr/share/licenses/widemelon/LICENSE"
}
