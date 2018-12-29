# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Christoph Zeiler <rabyte*gmail>

_name=gzdoom
pkgname=${_name}
pkgver=3.7.0
pkgrel=1
pkgdesc='Advanced Doom source port with OpenGL support'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:dumb' 'GPL3' 'LGPL3')
depends=('asmjit-git'
         'hicolor-icon-theme'
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
replaces=("${_name}1")
source=("${_name}::git://github.com/coelckers/${_name}.git#tag=g${pkgver}"
        "${_name}.desktop"
        '0001-Fix-soundfont-search-path.patch')
sha256sums=('SKIP'
            '59122e670f72aa2531aff370e7aaab2d886a7642e79e91f27a533d3b4cad4f6d'
            '11323f98caadb086b35cce1697744eeba53c96a3f4f9a8c9184ed23e6fb1ea61')

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
          -DCMAKE_DISABLE_FIND_PACKAGE_asmjit=TRUE \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DASMJIT_FOUND=TRUE \
          -DASMJIT_INCLUDE_DIR=/usr/include \
          -DASMJIT_LIBRARIES=asmjit \
          -DASMJIT_LIBRARY=asmjit \
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
    install -D -m644 fm_banks/GENMIDI.GS.wopl \
            "$pkgdir"/usr/share/$_name/fm_banks/GENMIDI.GS.wopl
    install -D -m644 fm_banks/gs-by-papiezak-and-sneakernets.wopn \
            "$pkgdir"/usr/share/$_name/fm_banks/gs-by-papiezak-and-sneakernets.wopn

    desktop-file-install --dir="$pkgdir"/usr/share/applications \
                         "$srcdir"/${_name}.desktop
    install -D -m644 src/posix/zdoom.xpm \
            "$pkgdir"/usr/share/icons/hicolor/256x256/apps/${_name}.xpm

    install -d "$pkgdir"/usr/share/licenses
    ln -s /usr/share/doc/$_name/licenses "$pkgdir"/usr/share/licenses/$pkgname
}
