# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=qzdoom
pkgname=${_name}
pkgver=2.1.0
pkgrel=1
pkgdesc='Advanced Doom source port with true color renderer'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:dumb' 'GPL3' 'LGPL3')
depends=('hicolor-icon-theme'
         'libgl'
         'libgme'
         'libjpeg'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'git'
             'gtk3')
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
            'soundfont-fluid: FluidR3 soundfont for FluidSynth'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
source=("${_name}::git://github.com/raa-eruanna/${_name}.git#tag=q${pkgver}"
        "${_name}.desktop"
        '0001-Fix-soundfont-search-path.patch')
sha256sums=('SKIP'
            '0b3bcbe2cdebda2fed887b796f4ff0fa51f3d544e80cab16b3b1cbd7813b7e04'
            '26cd2fa2285bcf4c9147a7f1763c217c3e7056bd4a729824f9af0104f6f410c9')

prepare() {
    cd $_name

    patch -p1 -i"$srcdir"/0001-Fix-soundfont-search-path.patch
}

build() {
    cd $_name

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_C_FLAGS="$CFLAGS -DSHARE_DIR=\\\"/usr/share/$_name\\\"" \
          -DCMAKE_CXX_FLAGS="$CXXFLAGS -DSHARE_DIR=\\\"/usr/share/$_name\\\"" \
          -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DINSTALL_PATH=bin \
          -DINSTALL_PK3_PATH=share/$_name \
          .
    make
}

package() {
    cd $_name

    make install DESTDIR="$pkgdir"
    install -D -m644 soundfonts/gzdoom.sf2 \
            "$pkgdir"/usr/share/$_name/soundfonts/gzdoom.sf2

    desktop-file-install --dir="$pkgdir"/usr/share/applications \
                         "$srcdir"/${_name}.desktop
    install -D -m644 src/posix/zdoom.xpm \
            "$pkgdir"/usr/share/icons/hicolor/256x256/apps/${_name}.xpm

    install -d "$pkgdir"/usr/share/licenses
    ln -s /usr/share/doc/$_name/licenses "$pkgdir"/usr/share/licenses/$pkgname
}
