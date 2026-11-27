pkgname=ngbrecomp-bin
pkgver=1.0.4
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
sha256sums=('8c62fe8933ace0a7fdefb8c7d1071bd5124631ec825018abab2570048522863b')

prepare() {
  cd "$srcdir"
  local elf_header section_start section_size section_count
  elf_header=$(LC_ALL=C readelf --file-header "$_appimage") || return 1
  section_start=$(awk '/Start of section headers:/ {print $5}' <<< "$elf_header")
  section_size=$(awk '/Size of section headers:/ {print $5}' <<< "$elf_header")
  section_count=$(awk '/Number of section headers:/ {print $5}' <<< "$elf_header")
  if [[ ! $section_start =~ ^[1-9][0-9]*$ ||
        ! $section_size =~ ^[1-9][0-9]*$ ||
        ! $section_count =~ ^[1-9][0-9]*$ ]]; then
    error "Could not locate the SquashFS payload in $_appimage"
    return 1
  fi

  # The Type 2 AppImage payload starts after the runtime's ELF section table.
  local offset=$((section_start + section_size * section_count))
  unsquashfs -no-progress -offset "$offset" "$_appimage" \
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
