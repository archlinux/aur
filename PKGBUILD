# Maintainer: MiguVT <contacto@miguvt.com>
pkgname=freesmlauncher-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Minecraft launcher with offline accounts support (binary release)"
arch=(x86_64 aarch64)
url='https://freesmlauncher.org/'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  fuse2
  hicolor-icon-theme
  java-runtime
  zlib
)
provides=(freesmlauncher)
conflicts=(freesmlauncher)
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::https://github.com/FreesmTeam/FreesmLauncher/releases/download/$pkgver/FreesmLauncher-Linux-x86_64.AppImage")
source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::https://github.com/FreesmTeam/FreesmLauncher/releases/download/$pkgver/FreesmLauncher-Linux-aarch64.AppImage")
sha256sums_x86_64=('6ee25a546d57a1d18723bbf76b22d886e958a392b7af054b9dba4355f760890b')
sha256sums_aarch64=('3f304b2f6d6be805ec6ce321ba925d47ca2cce33fa2b1366314c99c1c27ba1ea')
noextract=("$pkgname-$pkgver-x86_64.AppImage" "$pkgname-$pkgver-aarch64.AppImage")

prepare() {
  chmod +x "$pkgname-$pkgver-$CARCH.AppImage"
  ./"$pkgname-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null
}

package() {
  cd squashfs-root

  # Install the main binary
  install -Dm755 usr/bin/freesmlauncher "$pkgdir/usr/bin/freesmlauncher"

  # Install desktop file
  install -Dm644 usr/share/applications/org.freesmlauncher.FreesmLauncher.desktop \
    "$pkgdir/usr/share/applications/org.freesmlauncher.FreesmLauncher.desktop"

  # Install icons
  for size in 16 24 32 48 64 128 256; do
    install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/org.freesmlauncher.FreesmLauncher.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/org.freesmlauncher.FreesmLauncher.png"
  done

  # Install scalable icon
  install -Dm644 usr/share/icons/hicolor/scalable/apps/org.freesmlauncher.FreesmLauncher.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.freesmlauncher.FreesmLauncher.svg"

  # Install metainfo
  install -Dm644 usr/share/metainfo/org.freesmlauncher.FreesmLauncher.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.freesmlauncher.FreesmLauncher.metainfo.xml"

  # Install mime type file with renamed package
  install -Dm644 usr/share/mime/packages/modrinth-mrpack-mime.xml \
    "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  # Install man pages if they exist
  if [ -d usr/share/man ]; then
    cp -r usr/share/man "$pkgdir/usr/share/"
  fi

  # Install libraries
  install -dm755 "$pkgdir/usr/lib/freesmlauncher"
  cp -r usr/lib/* "$pkgdir/usr/lib/freesmlauncher/"
}

# vim:set ts=2 sw=2 et:
