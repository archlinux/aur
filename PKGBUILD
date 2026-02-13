# Maintainer: MiguVT <contacto@miguvt.com>
pkgname=freesmlauncher-bin
pkgver=2.0.0
pkgrel=3
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

  # Install the application to /opt
  install -dm755 "$pkgdir/opt/freesmlauncher"
  cp -r bin shared "$pkgdir/opt/freesmlauncher/"

  # Create wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/freesmlauncher" <<'EOF'
#!/bin/bash
cd /opt/freesmlauncher
exec ./bin/freesmlauncher "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/freesmlauncher"

  # Install desktop file
  install -Dm644 share/applications/org.freesmTeam.freesmlauncher.desktop \
    "$pkgdir/usr/share/applications/org.freesmTeam.freesmlauncher.desktop"

  # Install icons
  install -Dm644 share/icons/hicolor/256x256/apps/org.freesmTeam.freesmlauncher.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.freesmTeam.freesmlauncher.png"

  install -Dm644 share/icons/hicolor/scalable/apps/org.freesmTeam.freesmlauncher.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.freesmTeam.freesmlauncher.svg"

  # Install metainfo
  install -Dm644 share/metainfo/org.freesmTeam.freesmlauncher.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.freesmTeam.freesmlauncher.metainfo.xml"

  # Install mime type file with renamed package
  install -Dm644 share/mime/packages/modrinth-mrpack-mime.xml \
    "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

# vim:set ts=2 sw=2 et:
