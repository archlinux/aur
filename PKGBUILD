# Maintainer: ForkedInTime <montesinosa1@my.smccd.edu>
#
# KeeperFX (Dungeon Keeper remake) — native Linux build.
#
# This package builds the engine from a Linux-native fork of KeeperFX and
# stages the freely-redistributable KeeperFX data from the official upstream
# release. It does NOT ship the original Dungeon Keeper assets: 16 files are
# copyright EA/Bullfrog and must be supplied by the user from their own copy
# (GOG/CD). After installing this package, run `keeperfx-install` once to copy
# those 16 files from your DK install and build your playable game tree at
# ~/.local/share/keeperfx. Then launch with `keeperfx`.

pkgname=keeperfx
pkgver=1.3.2
pkgrel=1
pkgdesc='Dungeon Keeper remake (KeeperFX), native Linux build. Requires you own the original Dungeon Keeper.'
arch=('x86_64')
url='https://github.com/ForkedInTime/keeperfx'
license=('GPL2')
depends=('sdl2' 'ffmpeg' 'openal' 'lua' 'enet' 'zlib' 'libepoxy' 'minizip')
makedepends=('cmake' 'ninja' 'git' '7zip')
# Supersede the earlier hand-built local package, if present.
replaces=('keeperfx-linux')
conflicts=('keeperfx-linux')
optdepends=('dungeon-keeper-gold-gog: source for the 16 required original DK files')
options=('!debug')
install="${pkgname}.install"

# Two sources:
#  1. the Linux-native engine fork (builds on the user's machine), pinned to a tag
#  2. the official KeeperFX release archive — used ONLY to harvest free data;
#     its Windows binaries are discarded. Already free of the 16 copyright files.
_relfile="keeperfx_${pkgver//./_}_complete.7z"
source=("${pkgname}::git+https://github.com/ForkedInTime/keeperfx.git#tag=linux-v${pkgver}"
        "${_relfile}::https://github.com/dkfans/keeperfx/releases/download/v${pkgver}/${_relfile}")
noextract=("${_relfile}")
sha256sums=('SKIP'
            '2a8b0dcce85b954c5328f4c6cc8dc7f6ecf6243a4df04a7145fdc48c9aa45b8a')

build() {
  cd "$srcdir/$pkgname"
  # Native Linux toolchain (linux.cmake): system gcc, system libs via pkg-config,
  # source-only deps (libspng/centijson/astronomy) auto-cloned at configure time.
  # -ffile-prefix-map: strip the build path from __FILE__ log strings and debug
  # info so the binary is reproducible and carries no reference to $srcdir.
  local _pfx="-ffile-prefix-map=${srcdir}/${pkgname}/="
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_TOOLCHAIN_FILE="$srcdir/$pkgname/linux.cmake" \
    -DCMAKE_C_FLAGS="$_pfx" \
    -DCMAKE_CXX_FLAGS="$_pfx"
  cmake --build build --target keeperfx
}

package() {
  local R="$srcdir/$pkgname"
  local share="$pkgdir/usr/share/keeperfx"

  # --- engine binary (the launcher cd's into this dir) ---
  install -Dm755 "$R/build/keeperfx" "$share/keeperfx"

  # --- free data: extract the official release, strip the 16 owned files ---
  local fd="$srcdir/freedata-src"
  rm -rf "$fd"; mkdir -p "$fd"
  7z x -y "-o$fd" "$srcdir/${_relfile}" >/dev/null
  bash "$R/dist/linux/stage-free-data.sh" "$fd" "$share"

  # --- launcher / installer / uninstaller / docs / desktop ---
  install -Dm755 "$R/dist/linux/keeperfx-install"   "$pkgdir/usr/bin/keeperfx-install"
  install -Dm755 "$R/dist/linux/keeperfx"           "$pkgdir/usr/bin/keeperfx"
  install -Dm755 "$R/dist/linux/keeperfx-uninstall" "$pkgdir/usr/bin/keeperfx-uninstall"
  install -Dm644 "$R/dist/linux/README"             "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "$R/dist/linux/keeperfx.desktop"   "$pkgdir/usr/share/applications/keeperfx.desktop"

  # --- icons (filenames are zero-padded 3-digit, e.g. keeperfx_icon128-24bpp.png) ---
  local src
  for sz in 16 32 48 64 128 256 512; do
    src=$(ls "$R/res/keeperfx_icon$(printf %03d "$sz")-"*bpp.png 2>/dev/null | tail -1) || true
    if [ -n "$src" ]; then
      install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/keeperfx.png"
    fi
  done
}
