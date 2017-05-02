# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

_name=gzdoom
pkgname=${_name}
pkgver=3.0.0
pkgrel=1
pkgdesc='Advanced Doom source port with OpenGL support'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:dumb' 'GPL3' 'LGPL3')
depends=('hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libgme'
         'sdl2')
makedepends=('cmake'
             'fluidsynth'
             'git'
             'gtk3'
             'xdg-utils')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'fluidsynth: FluidSynth MIDI device'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'gtk3: IWAD selection dialog'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'libsndfile: WAV/FLAC/OGG audio support'
            'mpg123: MP3 audio support'
            'openal: in-game sound'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'timidity++: Timidity MIDI device'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
source=("${_name}::git://github.com/coelckers/${_name}.git#tag=g${pkgver}"
        "${_name}.sh"
        "${_name}.desktop")
sha256sums=('SKIP'
            'e8b3e33972524b08460b68c5920ac5f2bff5cfb377f74a556a562b1c84cc2851'
            '59122e670f72aa2531aff370e7aaab2d886a7642e79e91f27a533d3b4cad4f6d')

build() {
    cd $_name

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"/usr/share/$_name\\\"" \
          -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"/usr/share/$_name\\\"" \
          -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DINSTALL_PATH=lib/$_name \
          -DINSTALL_PK3_PATH=share/$_name \
          .
    make
}

package() {
    cd $_name

    make install DESTDIR="$pkgdir"

    install -D "$srcdir"/${_name}.sh "$pkgdir"/usr/bin/$_name

    install -d "$pkgdir"/usr/share/icons/hicolor
    (
        export XDG_DATA_DIRS="$pkgdir"/usr/share
        xdg-desktop-icon install --novendor \
                                 "$srcdir"/${_name}.desktop
        xdg-icon-resource install --noupdate \
                                  --novendor \
                                  --size 48 \
                                  src/posix/zdoom.xpm \
                                  $_name
    )

    install -d "$pkgdir"/usr/share/licenses
    ln -s /usr/share/doc/$_name/licenses "$pkgdir"/usr/share/licenses/$pkgname
}
