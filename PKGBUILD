# Maintainer: Vladimir B (Dexoron) <main@dexoron.tech>
# Contributor: AlexanderGhosty <byck.sash@gmail.com>
pkgname=cremniy-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="Integrated low-level development environment with code editor, HEX editor and disassembler"
arch=('x86_64')
url="https://github.com/munirov/cremniy"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'zlib'
  'fontconfig'
  'freetype2'
  'libpng'
  'e2fsprogs'
  'libgpg-error'
)
provides=('cremniy')
conflicts=('cremniy' 'cremniy-git')
options=('!strip')

source=(
  "cremniy-${pkgver}.AppImage::https://github.com/munirov/cremniy/releases/download/v${pkgver}/cremniy-linux-v${pkgver}.AppImage"
  "cremniy.desktop::https://raw.githubusercontent.com/munirov/cremniy/v${pkgver}/cremniy.desktop"
  "LICENSE::https://raw.githubusercontent.com/munirov/cremniy/v${pkgver}/LICENSE"
)

sha256sums=(
  'd67fc8310619b59f326abcf2a53e0305f9c135aaab1c3c1c58b4a376e785b940'
  '55233cb64c4e907fc2c0582d6a6d02370c08f5ea19966bf08a02b67dd3a8d70f'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

prepare() {
  chmod +x "cremniy-${pkgver}.AppImage"
  "./cremniy-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -d "$pkgdir/opt/cremniy"
  cp -a "$srcdir/squashfs-root/usr" "$pkgdir/opt/cremniy/"

  find "$pkgdir/opt/cremniy" -type d -exec chmod 755 {} +
  find "$pkgdir/opt/cremniy" -type f -perm /111 -exec chmod 755 {} +

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cremniy" <<'EOF'
#!/bin/sh
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/cremniy/usr/plugins/platforms
exec /opt/cremniy/usr/bin/cremniy "$@"
EOF

  install -Dm644 "$srcdir/cremniy.desktop" \
    "$pkgdir/usr/share/applications/cremniy.desktop"
  sed -i '1{/^#!/d;}' "$pkgdir/usr/share/applications/cremniy.desktop"
  sed -i 's|^Icon=.*|Icon=cremniy|' "$pkgdir/usr/share/applications/cremniy.desktop"

  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256/apps/cremniy.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/cremniy.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -f "$pkgdir/opt/cremniy/usr/share/applications/cremniy.desktop"
  rm -f "$pkgdir/opt/cremniy/usr/share/icons/hicolor/256x256/apps/cremniy.png"

  find "$pkgdir/opt/cremniy" -type d -empty -delete
}
