# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=gzdoom
pkgname=${_name}1
pkgver=1.9.1
pkgrel=5
pkgdesc='Advanced Doom source port with OpenGL support (legacy version)'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=('gtk2'
         'libgl'
         'libgme'
         'libsndfile'
         'mpg123'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'git'
             'imagemagick'
             'openal')
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
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git://github.com/coelckers/${_name}.git#tag=g${pkgver}"
        "${_name}.desktop"
        '0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch')
sha256sums=('SKIP'
            '59122e670f72aa2531aff370e7aaab2d886a7642e79e91f27a533d3b4cad4f6d'
            '0d2d7ec04d35359b20a927c5afed87e3aaaf3836953cfe534861a92316188174')

prepare() {
    cd $_name

    patch -p 1 -i "$srcdir"/0001-Improve-Mac-GCC-errors-fix-to-work-only-for-GCC.patch
}

build() {
    cd $_name

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DNO_FMOD=ON \
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
    install -D -m644 brightmaps.pk3 "$pkgdir"/usr/share/$_name/brightmaps.pk3
    install -D -m644 lights.pk3 "$pkgdir"/usr/share/$_name/lights.pk3

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
