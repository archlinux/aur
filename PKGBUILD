# Maintainer: Jiri Doubravsky (DoubyCz) <douby@douby.cz>
#
# OpenKingdoms - from-scratch open-source engine for Total Annihilation: Kingdoms
# (Cavedog, 1999), written in C11. Native Linux build against the system SDL2,
# so nothing is bundled. The engine ships no game content and never will: it
# reads the original .hpi archives, which the user supplies from their own copy
# (GOG Total Annihilation Commander Pack, or the original CDs).
#
# Point the engine at your copy with --game-dir, or export TAK_GAME_DIR.
# The folder is remembered after the first run.

pkgname=openkingdoms-git
pkgver=0.1.4.r2.gddcfbdb
pkgrel=1
pkgdesc='Open-source engine for Total Annihilation: Kingdoms (1999). Requires you own the original game.'
arch=('x86_64')
url='https://github.com/OpenKingdoms/OpenKingdoms'
license=('GPL-3.0-or-later')
# 'sdl2' is deliberate rather than 'sdl2-compat': Arch currently satisfies it
# with sdl2-compat (which provides sdl2=2.32.x), and naming the virtual package
# keeps working if a real sdl2 ever returns.
# ffmpeg: Bink playback (the main menu door clips and the cut scenes).
depends=('sdl2' 'ffmpeg')
makedepends=('git' 'cmake' 'ninja')   # gcc/make come from base-devel
provides=('openkingdoms')
conflicts=('openkingdoms')
options=('!debug')
install="${pkgname}.install"

# Local checkout name kept separate from $pkgname so a cached VCS clone is not
# confused with the package directory.
_srcname=OpenKingdoms
source=("${_srcname}::git+https://github.com/OpenKingdoms/OpenKingdoms.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    # Upstream tags are v0.1.4 -> 0.1.4.r<commits since tag>.g<hash>
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf '0.0.0.r%s.g%s' \
               "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${_srcname}"
    # TAK_GAME_DIR is deliberately left empty: a package must not bake in one
    # user's path. The engine asks for the folder on first run and remembers it.
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTAK_GAME_DIR=
    cmake --build build
}

check() {
    cd "${srcdir}/${_srcname}"
    # Tests that load real game data carry the CTest label needs-data and are
    # excluded here, the same way upstream CI does it: a build host has no game
    # files and those cases would only skip (and a skip exits nonzero).
    ctest --test-dir build --output-on-failure --label-exclude needs-data
}

package() {
    cd "${srcdir}/${_srcname}"
    DESTDIR="${pkgdir}" cmake --install build

    # Upstream installs the binary as `tak-re`; add the name people know it by.
    ln -s tak-re "${pkgdir}/usr/bin/openkingdoms"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/ASSETS.md "${pkgdir}/usr/share/doc/${pkgname}/ASSETS.md"

    # No icon is shipped: the game's own icon lives in the original data, which
    # is copyrighted and must not be redistributed. A stock category icon is used.
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openkingdoms.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=OpenKingdoms
GenericName=Real-time strategy
Comment=Engine for Total Annihilation: Kingdoms (needs your own copy of the game)
Exec=openkingdoms
Icon=applications-games
Terminal=false
Categories=Game;StrategyGame;
Keywords=kingdoms;total;annihilation;rts;cavedog;
EOF
}
