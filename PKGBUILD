# Maintainer: Jiri Doubravsky (DoubyCz) <douby@douby.cz>
#
# KeeperFX (Dungeon Keeper remake) - native Linux build from the DoubyCz fork,
# built via linux.mk. Uses the system SDL2 (Arch's is recent enough for Wayland),
# so unlike the AppImage no library bundling is needed. The freely-redistributable
# KeeperFX data is bundled; the 16 original Dungeon Keeper files (copyright
# EA/Bullfrog) must be supplied by the user from their own copy (GOG/Steam/CD)
# via `keeperfx-install` after installation.

pkgname=keeperfx-git
pkgver=1.3.2.r0.g0000000
pkgrel=1
pkgdesc='Dungeon Keeper remake (KeeperFX), native Linux build. Requires you own the original Dungeon Keeper.'
arch=('x86_64')
url='https://github.com/DoubyCz/keeperfx'
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'sdl2_image' 'ffmpeg' 'openal' 'luajit'
         'libspng' 'minizip' 'miniupnpc' 'libnatpmp' 'zlib' 'openssl' 'zstd')
makedepends=('git' 'make' 'gcc' 'curl' '7zip')
optdepends=('dungeon-keeper-gog: a source for the original DK files needed by keeperfx-install')
provides=('keeperfx')
conflicts=('keeperfx')
options=('!debug' '!strip')
install="${pkgname}.install"

_branch=linux-build-modern-gcc
_datever=1.3.2
_data7z="keeperfx_${_datever//./_}_complete.7z"
source=("${pkgname}::git+https://github.com/DoubyCz/keeperfx.git#branch=${_branch}"
        "${_data7z}::https://github.com/dkfans/keeperfx/releases/download/v${_datever}/${_data7z}")
noextract=("${_data7z}")
sha256sums=('SKIP'
            '2a8b0dcce85b954c5328f4c6cc8dc7f6ecf6243a4df04a7145fdc48c9aa45b8a')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf '%s.r%s.g%s' "$_datever" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  # linux.mk downloads its own prebuilt static deps (astronomy/centijson/enet6/libcurl)
  # and links everything else against the system libraries.
  # -ffile-prefix-map strips the build path from debug info / __FILE__ log strings, so the
  # package does not embed a reference to $srcdir (reproducible, avoids the namcap warning),
  # while keeping symbols for crash backtraces (the build is intentionally not stripped).
  make -f linux.mk -j"$(nproc)" \
    CC="cc -ffile-prefix-map=$srcdir/$pkgname=." \
    CXX="g++ -ffile-prefix-map=$srcdir/$pkgname=." \
    all
}

package() {
  cd "$pkgname"

  # --- engine binary ---
  install -Dm755 bin/keeperfx "$pkgdir/usr/lib/$pkgname/keeperfx"

  # --- free, redistributable KeeperFX data (official release; free of the 16 owned files) ---
  local fd="$srcdir/freedata"
  rm -rf "$fd"; mkdir -p "$fd"
  7z x -y "-o$fd" "$srcdir/$_data7z" >/dev/null
  install -d "$pkgdir/usr/share/$pkgname"
  local d
  for d in data fxdata ldata levels sound campgns creatrs mods music; do
    [ -d "$fd/$d" ] && cp -r "$fd/$d" "$pkgdir/usr/share/$pkgname/"
  done
  [ -f "$fd/keeperfx.cfg" ] && install -Dm644 "$fd/keeperfx.cfg" "$pkgdir/usr/share/$pkgname/keeperfx.cfg"

  # --- launcher wrapper ---
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/keeperfx" <<'WRAP'
#!/bin/sh
# KeeperFX launcher: maintain a writable game folder and run the engine from it.
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx}"
mkdir -p "$GAMEDIR"
# Deploy the free FX data (no-clobber keeps the user's original DK files, saves and config).
cp -rn /usr/share/keeperfx-git/. "$GAMEDIR/" 2>/dev/null || true
cd "$GAMEDIR" || exit 1
if [ ! -f "$GAMEDIR/sound/atlas/bullfrog.sbk" ] && [ ! -f "$GAMEDIR/data/cube.dat" ]; then
  echo "KeeperFX needs the original Dungeon Keeper files. Run:  keeperfx-install /path/to/DungeonKeeper"
fi
exec /usr/lib/keeperfx-git/keeperfx "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/keeperfx"

  # --- helper to import the original DK files (lowercased, no-clobber) ---
  cat > "$pkgdir/usr/bin/keeperfx-install" <<'INST'
#!/bin/sh
# Copy the original Dungeon Keeper files into the KeeperFX game folder.
# Usage: keeperfx-install /path/to/original/DungeonKeeper   (GOG install dir, or CD 'keeper' folder)
SRC="$1"
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx}"
[ -n "$SRC" ] && [ -d "$SRC" ] || { echo "Usage: keeperfx-install /path/to/original/DungeonKeeper"; exit 1; }
mkdir -p "$GAMEDIR"
cp -rn /usr/share/keeperfx-git/. "$GAMEDIR/" 2>/dev/null || true
for sub in data ldata sound levels; do
  [ -d "$SRC/$sub" ] || continue
  ( cd "$SRC/$sub" && find . -type f ) | while IFS= read -r f; do
    lc=$(printf '%s' "$f" | tr 'A-Z' 'a-z'); lc="${lc#./}"
    dest="$GAMEDIR/$sub/$lc"
    [ -e "$dest" ] || { mkdir -p "$(dirname "$dest")"; cp "$SRC/$sub/$f" "$dest"; }
  done
done
echo "Original DK data copied into $GAMEDIR. Start the game with:  keeperfx"
INST
  chmod 755 "$pkgdir/usr/bin/keeperfx-install"

  # --- desktop entry + icons ---
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/keeperfx.desktop" <<'DESK'
[Desktop Entry]
Type=Application
Name=KeeperFX
Comment=Open source remake and fan expansion of Dungeon Keeper
Exec=keeperfx
Icon=keeperfx
Categories=Game;StrategyGame;
Terminal=false
DESK
  local sz src
  for sz in 16 32 48 64 128 256 512; do
    src=$(ls "res/keeperfx_icon$(printf %03d "$sz")-"*bpp.png 2>/dev/null | tail -1) || true
    [ -n "$src" ] && install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/keeperfx.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
