# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=hookshot-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="Builds a native PC port of Ocarina of Time (Switch 2) from your own copy of the game (upstream AppImage)"
arch=('x86_64')
url="https://github.com/NotRexed/Hookshot"
license=('GPL-3.0-or-later')
# the AppImage brings Python with Tk, clang, lld, a glibc sysroot, FFmpeg and
# SDL2; these are what its files link to outside the bundle (readelf -d).
# The game it builds loads libvulkan at runtime.
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11'
  'libxcrypt' 'sh' 'vulkan-driver' 'vulkan-icd-loader' 'zlib')
optdepends=('libpulse: game sound'
  'xdg-utils: the Open folder button'
  'zenity: error dialog when no game is built yet')
provides=('hookshot')
conflicts=('hookshot')
# staticlibs: the builder links the game against the sysroot's libm.a
options=('!strip' '!debug' 'staticlibs')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Hookshot-v${pkgver}-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('464ba1a7ca1b5bddc86ce5a75dba929e280aa681f6bc1ac383d23035808b5b10')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  # upstream's AppImage payload, installed unchanged. Its Update button puts
  # newer builders into ~/.local/share/hookshot/builder, never into /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"
  rm -f "$pkgdir/opt/$pkgname/.DirIcon"

  # AppRun resolves its own directory, so it has to be exec'd by its real
  # path - a symlink from /usr/bin would make it look next to the symlink
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/hookshot-builder" << EOF
#!/bin/sh
exec /opt/$pkgname/AppRun "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/hookshot-builder"

  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256/apps/hookshot.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/hookshot.png"
  install -Dm644 "$srcdir/squashfs-root/hookshot-builder.desktop" \
    "$pkgdir/usr/share/applications/hookshot-builder.desktop"
  sed -i 's|^Exec=AppRun|Exec=hookshot-builder|' \
    "$pkgdir/usr/share/applications/hookshot-builder.desktop"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/usr/share/hookshot/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s "/opt/$pkgname/usr/share/hookshot/licenses" "$pkgdir/usr/share/licenses/$pkgname/third-party"
}
