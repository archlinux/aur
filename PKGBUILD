pkgname=ngbrecomp-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Ninja Gaiden Black Recompiled, packaged from the official Linux AppImage'
arch=('x86_64')
url='https://github.com/gamboozino/ngbrecomp'
license=('GPL-3.0-or-later')
depends=(
  'dbus' 'fontconfig' 'freetype2' 'fuse2' 'gcc-libs' 'glibc' 'harfbuzz'
  'libarchive' 'libbsd' 'libglvnd' 'libx11' 'libxcb' 'md4c'
  'vulkan-driver' 'vulkan-icd-loader' 'wayland' 'zlib' 'zstd'
)
makedepends=('squashfs-tools')
provides=("ngbrecomp=$pkgver")
conflicts=('ngbrecomp')
options=('!strip' '!debug')

_appimage="ngbrecomp-$pkgver.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/NinjaGaidenBlack-x86_64.AppImage")
noextract=("$_appimage")
sha256sums=('d6fcc6865f2d153214a0d0623c143036d78596790c57fd4650f9ed02809f54b2')

prepare() {
  cd "$srcdir"
  # The SquashFS starts after the runtime in this checksum-pinned AppImage.
  unsquashfs -no-progress -offset 944632 "$_appimage" \
    ninja-gaiden-black.desktop ninja-gaiden-black.png usr/share/licenses/NinjaGaidenBlack
}

package() {
  cd "$srcdir"
  install -Dm755 "$_appimage" "$pkgdir/opt/ngbrecomp/NinjaGaidenBlack.AppImage"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/ngbrecomp" <<'LAUNCHER'
#!/bin/sh
exec /opt/ngbrecomp/NinjaGaidenBlack.AppImage "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/ngbrecomp"

  install -Dm644 squashfs-root/ninja-gaiden-black.desktop \
    "$pkgdir/usr/share/applications/ninja-gaiden-black.desktop"
  sed -i 's/^Exec=NinjaGaidenBlack /Exec=ngbrecomp /' \
    "$pkgdir/usr/share/applications/ninja-gaiden-black.desktop"

  install -Dm644 squashfs-root/ninja-gaiden-black.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ninja-gaiden-black.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    squashfs-root/usr/share/licenses/NinjaGaidenBlack/*
}
