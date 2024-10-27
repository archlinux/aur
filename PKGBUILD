# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Andrew Rabert <arabert@nullsum.net>

pkgname=zdoom
pkgver=2.8.1
pkgrel=6
pkgdesc='Advanced Doom source port'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=('gtk2'
         'libgme'
         'libsndfile'
         'mpg123'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'imagemagick'
             'openal'
             'p7zip')
makedepends_i686=('nasm')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'fluidsynth: FluidSynth MIDI device'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'openal: in-game sound'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'timidity++: Timidity MIDI device'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
source=("http://zdoom.org/files/zdoom/${pkgver%.${pkgver#*.*.}}/zdoom-${pkgver}-src.7z"
        'zdoom.desktop'
        '0001-Fix-file-paths.patch'
        '0002-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch')
noextract=("${source[0]##*/}")
sha256sums=('782179d4667d2e56e26e21d7a0872523f8e4262ed176072fef00d0043376a310'
            'e8932a559baf30ecbfc062546ca014c6dfb70f76d1570549654209d39157e350'
            '2e9edd1f776a1e706f21e35b6f066fcd086dece2e9e4e0832ab9714658ff6b6b'
            '3de616393fa2eea8540c59c983a4394b29a0a0220095297a3f47e4f721b8d9fb')

prepare() {
    7z x -ozdoom -y "${source[0]##*/}" >/dev/null
    cd zdoom
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
    patch -i "$srcdir"/0002-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch -p 1
}

build() {
    cd zdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D NO_FMOD=ON \
          -D GME_INCLUDE_DIR=/usr/include/gme \
          -D FORCE_INTERNAL_GME=OFF \
          -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/zdoom\\\"" \
          -D CMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          .
    make -C build
    sed -n '/\*\*-/,/\*\*-/p' src/version.h >bsd.txt
    convert 'src/win32/icon1.ico[2]' zdoom.xpm
}

package() {
    cd zdoom
    install build/zdoom -D -t "$pkgdir"/usr/bin
    install build/zdoom.pk3 -D -m 644 -t "$pkgdir"/usr/share/zdoom
    install -d "$pkgdir"/usr/share/licenses/zdoom
    install bsd.txt -m 644 "$pkgdir"/usr/share/licenses/zdoom/bsd.txt
    install docs/BUILDLIC.TXT -m 644 "$pkgdir"/usr/share/licenses/zdoom/buildlic.txt
    install docs/doomlic.txt -m 644 "$pkgdir"/usr/share/licenses/zdoom/doomlic.txt
    install dumb/licence.txt -m 644 "$pkgdir"/usr/share/licenses/zdoom/dumb.txt
    desktop-file-install "$srcdir"/zdoom.desktop --dir="$pkgdir"/usr/share/applications
    install zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zdoom.xpm
}

# vim: ts=2 sw=2 et:
