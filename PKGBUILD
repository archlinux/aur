# Maintainer: Jiri Doubravsky (DoubyCz) <douby@douby.cz>
#
# KeeperFX (Dungeon Keeper remake) - native Linux build from upstream (dkfans),
# built via linux.mk. Uses the system SDL2 (Arch's is recent enough for Wayland),
# so unlike the AppImage no library bundling is needed. The freely-redistributable
# KeeperFX data is bundled; the 16 original Dungeon Keeper files (copyright
# EA/Bullfrog) must be supplied by the user from their own copy (GOG/Steam/CD)
# via `keeperfx-install` after installation.

pkgname=keeperfx-git
pkgver=1.4.0.r0.g0000000
pkgrel=1
pkgdesc='Dungeon Keeper remake (KeeperFX), native Linux build. Requires you own the original Dungeon Keeper.'
arch=('x86_64')
url='https://github.com/dkfans/keeperfx'
license=('GPL-2.0-or-later')
depends=('sdl2-compat' 'sdl2_mixer' 'sdl2_net' 'sdl2_image' 'ffmpeg' 'openal' 'luajit'
         'libspng' 'minizip' 'miniupnpc' 'libnatpmp' 'zlib' 'openssl' 'zstd'
         'zenity')   # graphical first-run folder picker (kdialog auto-used if present instead)
makedepends=('git' 'make' 'gcc' 'curl' '7zip')
optdepends=('dungeon-keeper-gog: a source for the original DK files needed by keeperfx-install')
provides=('keeperfx')
conflicts=('keeperfx')
options=('!debug' '!strip')
install="${pkgname}.install"

_branch=master
_datever=1.4.0
_data7z="keeperfx_${_datever//./_}_complete.7z"
source=("${pkgname}::git+https://github.com/dkfans/keeperfx.git#branch=${_branch}"
        "${_data7z}::https://github.com/dkfans/keeperfx/releases/download/v${_datever}/${_data7z}")
noextract=("${_data7z}")
sha256sums=('SKIP'
            '82d9d5634e8ea6cabb8f62fbd4830b758919893863cd313517af256a3040a279')

pkgver() {
  # Derive a clean VCS version from the bundled data release + commit count + short
  # hash (<datever>.rN.gHASH), independent of upstream's own tag scheme.
  cd "$pkgname"
  printf '%s.r%s.g%s' "$_datever" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
# KeeperFX launcher: maintain a writable game folder, make sure the original Dungeon
# Keeper data is present (offering a graphical folder picker on a GUI first run), then
# run the engine. Crucially it does NOT launch the engine without data — a GUI user who
# double-clicks the icon would otherwise see nothing happen and no error.
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx}"
mkdir -p "$GAMEDIR"
# Deploy the free FX data (no-clobber keeps the user's original DK files, saves and config).
cp -rn /usr/share/keeperfx-git/. "$GAMEDIR/" 2>/dev/null || true
cd "$GAMEDIR" || exit 1

has_data() { [ -f "$GAMEDIR/sound/atlas/bullfrog.sbk" ] || [ -f "$GAMEDIR/data/cube.dat" ]; }
have()     { command -v "$1" >/dev/null 2>&1; }
gui()      { [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; }
# Run a host GUI tool with a clean library path: an AppImage/Flatpak sets LD_LIBRARY_PATH
# to bundled libs, which crashes the system zenity/kdialog. Harmless for the native build.
sysrun()   { env -u LD_LIBRARY_PATH "$@"; }

# Portable "pick an existing directory": GTK zenity (GNOME/Fedora/Ubuntu) or Qt kdialog (KDE).
pick_dir() {
  if   have zenity;  then sysrun zenity  --file-selection --directory \
         --title="Select your original Dungeon Keeper folder (GOG install dir / CD 'keeper')"
  elif have kdialog; then sysrun kdialog --title "KeeperFX" --getexistingdirectory "$HOME"
  else return 1; fi
}
# Show an error graphically if we can, always echo to the terminal too.
notify_err() {
  echo "$1" >&2
  gui || return 0
  if   have zenity;  then sysrun zenity  --error --title="KeeperFX" --text="$1" 2>/dev/null
  elif have kdialog; then sysrun kdialog --title "KeeperFX" --error "$1"          2>/dev/null
  fi
}

if ! has_data; then
  echo "KeeperFX needs the original Dungeon Keeper files (you must own the game)." >&2
  echo "From a terminal import them with:  keeperfx-install /path/to/DungeonKeeper" >&2

  # Graphical first run: offer a folder picker and import the data for the user.
  if gui && { have zenity || have kdialog; }; then
    src=$(pick_dir)
    [ -n "$src" ] && [ -d "$src" ] && keeperfx-install "$src"
  fi

  if ! has_data; then
    notify_err "No Dungeon Keeper data found.

Run  keeperfx-install /path/to/DungeonKeeper  (your GOG install dir, or the 'keeper' folder from CD) and start KeeperFX again."
    exit 1
  fi
fi

exec /usr/lib/keeperfx-git/keeperfx "$@"
WRAP
  chmod 755 "$pkgdir/usr/bin/keeperfx"

  # --- helper to import the original DK files (lowercased, no-clobber) ---
  cat > "$pkgdir/usr/bin/keeperfx-install" <<'INST'
#!/bin/sh
# Copy the original Dungeon Keeper files into the KeeperFX game folder.
# Usage: keeperfx-install /path/to/original/DungeonKeeper   (GOG install dir, or CD 'keeper' folder)
# Forgiving about the exact folder: accepts the DK root, its inner `data` folder, OR a
# parent directory that contains the install — it locates the data and imports the right root.
SRC="$1"
GAMEDIR="${KEEPERFX_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/keeperfx}"
[ -n "$SRC" ] && [ -d "$SRC" ] || { echo "Usage: keeperfx-install /path/to/original/DungeonKeeper"; exit 1; }

# Resolve the real DK root: find the signature file cube.dat (any depth/case) and take its
# grandparent — cube.dat lives in <root>/data/cube.dat, so this yields <root> whether the
# user picked the root, the inner `data` folder, or a parent containing the game.
cube=$(find "$SRC" -maxdepth 4 -iname 'cube.dat' 2>/dev/null | head -1)
if [ -n "$cube" ]; then
  SRC=$(CDPATH= cd -- "$(dirname "$(dirname "$cube")")" && pwd)
  echo "Using Dungeon Keeper data in: $SRC"
else
  echo "No Dungeon Keeper data (cube.dat) found under: $1" >&2
  echo "Select your GOG install folder or the CD 'keeper' folder." >&2
  exit 1
fi

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

if [ -f "$GAMEDIR/data/cube.dat" ]; then
  echo "Original DK data copied into $GAMEDIR. Start the game with:  keeperfx"
else
  echo "Import finished but data/cube.dat is missing in $GAMEDIR — the selected folder looks incomplete." >&2
  exit 1
fi
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
