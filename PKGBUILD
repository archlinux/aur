# Maintainer: 9M2PJU <https://github.com/9M2PJU>
# Static recompilation of C&C Red Alert 2 and Yuri's Revenge to native code.
# Needs your OWN copy of the game (game.exe + gamemd.exe); the package ships
# only this repository's source. First run of redalert2-recomp-setup copies
# it to ~/.local/share/redalert2-recomp, finds the game in your Steam
# libraries (or --game-dir), then analyses, lifts and builds each game
# (30-60 minutes, ~6 GB, once).
pkgname=redalert2-recomp-git
_pkgname=redalert2-recomp
pkgver=0.1.3.r0.g0000000
pkgrel=2
pkgdesc="Static recompilation of Red Alert 2 and Yuri's Revenge to native Linux (needs your own game copy)"
arch=('x86_64')
url="https://github.com/sp00nznet/redalert2-recomp"
license=('MIT')
depends=('gcc' 'lib32-gcc-libs' 'lib32-glibc' 'cmake' 'ninja' 'pkgconf'
         'python' 'git' 'lib32-sdl2-compat' 'lib32-sdl2_ttf' 'ttf-liberation')
makedepends=('git')
optdepends=('lib32-ffmpeg: Bink movies (intro/cutscenes); without it build with CMAKE_ARGS=-DWITH_FFMPEG=OFF'
            'wine: play the Windows builds instead of the native ones (setup --wine)'
            'steam: source of the game files (Proton)')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/sp00nznet/redalert2-recomp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "0.1.3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"

    # Pristine source tree. Build output, the game link and the venv never
    # belong to the package: they live in the per-user copy instead.
    install -d "$pkgdir/usr/share/$_pkgname"
    git archive HEAD | tar -x -C "$pkgdir/usr/share/$_pkgname"
    echo "$pkgver" > "$pkgdir/usr/share/$_pkgname/.pkg-version"

    # /usr/bin/redalert2-recomp-setup
    cat > "$pkgdir/usr/bin-redalert2-recomp-setup" <<'EOF'
#!/bin/sh
# Build/update driver: sync the packaged source to a per-user copy (the
# 30-60 minute pipeline needs a writable tree and your own game files) and
# run setup.sh there. On upgrade the source re-syncs while the game link,
# the function catalogues (work/) and the lifted C (src/recomp/gen*) are
# kept, so an update costs a recompile, not a re-lift.
set -e
SRC=/usr/share/redalert2-recomp
DST=${XDG_DATA_HOME:-$HOME/.local/share}/redalert2-recomp
VER_FILE=.pkg-version
want=$(cat "$SRC/$VER_FILE" 2>/dev/null || echo unknown)
have=$(cat "$DST/$VER_FILE" 2>/dev/null || echo none)
if [ ! -f "$DST/setup.sh" ] || [ "$want" != "$have" ]; then
    if [ -f "$DST/setup.sh" ]; then
        echo "redalert2-recomp: updating user copy $have -> $want (keeping game link, work/ and lifted C)"
    else
        echo "redalert2-recomp: first run, copying source to $DST"
    fi
    mkdir -p "$DST"
    KEEP=$(mktemp -d)
    for p in game work src/recomp/gen src/recomp/gen_game .venv; do
        if [ -e "$DST/$p" ] || [ -L "$DST/$p" ]; then
            mkdir -p "$KEEP/$(dirname "$p")"
            mv "$DST/$p" "$KEEP/$p"
        fi
    done
    find "$DST" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
    cp -a "$SRC/." "$DST/"
    for p in game work src/recomp/gen src/recomp/gen_game .venv; do
        if [ -e "$KEEP/$p" ] || [ -L "$KEEP/$p" ]; then
            mkdir -p "$DST/$(dirname "$p")"
            rm -rf "$DST/$p"
            mv "$KEEP/$p" "$DST/$p"
        fi
    done
    rm -rf "$KEEP"
fi
exec "$DST/setup.sh" "$@"
EOF
    install -d "$pkgdir/usr/bin"
    install -m755 "$pkgdir/usr/bin-redalert2-recomp-setup" "$pkgdir/usr/bin/redalert2-recomp-setup"
    rm "$pkgdir/usr/bin-redalert2-recomp-setup"

    # /usr/bin/redalert2-recomp-play
    cat > "$pkgdir/usr/bin-redalert2-recomp-play" <<'EOF'
#!/bin/sh
# Play an already-built game out of the per-user copy.
set -e
DST=${XDG_DATA_HOME:-$HOME/.local/share}/redalert2-recomp
case "${1:-yr}" in
    ra2) g=ra2; shift ;;
    yr)  g=yr; shift ;;
    -*)  g=yr ;;
    *) echo "usage: $(basename "$0") [yr|ra2] [args...]" >&2; exit 2 ;;
esac
if [ "$g" = ra2 ]; then exe=build-linux-game/ra2; else exe=build-linux/ra2; fi
if [ ! -d "$DST" ] || [ ! -x "$DST/$exe" ]; then
    echo "redalert2-recomp-play: no built $g here yet." >&2
    echo "Run: redalert2-recomp-setup $g   (needs your own copy of the game)" >&2
    exit 1
fi
cd "$DST"
exec "$exe" --run "$@"
EOF
    install -m755 "$pkgdir/usr/bin-redalert2-recomp-play" "$pkgdir/usr/bin/redalert2-recomp-play"
    rm "$pkgdir/usr/bin-redalert2-recomp-play"

    # Desktop entries + icon + man pages.
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/yuris-revenge-recomp.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Yuri's Revenge (recomp)
GenericName=Real-time strategy game
Comment=Static recompilation of Yuri's Revenge (needs your own copy of the game)
Exec=redalert2-recomp-play yr
Icon=redalert2-recomp
Terminal=false
Categories=Game;StrategyGame;
Keywords=ra2;yuri;revenge;recomp;command;conquer;
StartupNotify=false
EOF
    cat > "$pkgdir/usr/share/applications/red-alert-2-recomp.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Red Alert 2 (recomp)
GenericName=Real-time strategy game
Comment=Static recompilation of Red Alert 2 (needs your own copy of the game)
Exec=redalert2-recomp-play ra2
Icon=redalert2-recomp
Terminal=false
Categories=Game;StrategyGame;
Keywords=ra2;red;alert;recomp;command;conquer;
StartupNotify=false
EOF
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cat > "$pkgdir/usr/share/icons/hicolor/scalable/apps/redalert2-recomp.svg" <<'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect x="2" y="2" width="60" height="60" rx="12" fill="#1a1a1a"/>
  <rect x="2" y="2" width="60" height="60" rx="12" fill="none" stroke="#d0342c" stroke-width="3"/>
  <path d="M32 10 L37.5 25.5 L54 25.5 L40.7 35 L45.5 51 L32 41.5 L18.5 51 L23.3 35 L10 25.5 L26.5 25.5 Z" fill="#d0342c"/>
</svg>
EOF
    install -d "$pkgdir/usr/share/man/man1"
    gzip -9 -n -c packaging/common/redalert2-recomp-setup.1 > "$pkgdir/usr/share/man/man1/redalert2-recomp-setup.1.gz"
    gzip -9 -n -c packaging/common/redalert2-recomp-play.1 > "$pkgdir/usr/share/man/man1/redalert2-recomp-play.1.gz"
    install -d "$pkgdir/usr/share/licenses/$_pkgname"
    install -m644 LICENSE NOTICE.md "$pkgdir/usr/share/licenses/$_pkgname/"
}
