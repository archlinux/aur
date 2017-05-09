# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Andrew Rabert <arabert@nullsum.net>

_name=zdoom
pkgname=${_name}
pkgver=2.8.1
pkgrel=5
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
source=("http://zdoom.org/files/${_name}/${pkgver%.${pkgver#*.*.}}/${_name}-${pkgver}-src.7z"
        "${_name}.desktop"
        '0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch')
noextract=("${source[0]##*/}")
sha256sums=('782179d4667d2e56e26e21d7a0872523f8e4262ed176072fef00d0043376a310'
            'e8932a559baf30ecbfc062546ca014c6dfb70f76d1570549654209d39157e350'
            '3de616393fa2eea8540c59c983a4394b29a0a0220095297a3f47e4f721b8d9fb')

prepare() {
    7z x -o${_name} -y "${source[0]##*/}" >/dev/null

    cd $_name

    patch -p 1 -i "$srcdir"/0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch
}

build() {
    cd $_name

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DNO_FMOD=ON \
          -DGME_INCLUDE_DIR='/usr/include/gme' \
          -DFORCE_INTERNAL_GME=OFF \
          -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"/usr/share/${_name}\\\"" \
          -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          .
    make

    sed -n '/\*\*-/,/\*\*-/p' src/version.h >bsd.txt

    convert 'src/win32/icon1.ico[2]' ${_name}.xpm
}

package() {
    cd $_name

    install -D $_name "$pkgdir"/usr/bin/$_name
    install -D -m644 ${_name}.pk3 "$pkgdir"/usr/share/$_name/${_name}.pk3

    desktop-file-install --dir="$pkgdir"/usr/share/applications \
                         "$srcdir"/${_name}.desktop
    install -D -m644 ${_name}.xpm \
            "$pkgdir"/usr/share/icons/hicolor/48x48/apps/${_name}.xpm

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 bsd.txt "$pkgdir"/usr/share/licenses/$pkgname/bsd.txt
    install -m644 docs/BUILDLIC.TXT "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
    install -m644 docs/doomlic.txt "$pkgdir"/usr/share/licenses/$pkgname/doomlic.txt
    install -m644 dumb/licence.txt "$pkgdir"/usr/share/licenses/$pkgname/dumb.txt
}
