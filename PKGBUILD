# Maintainer: Jan Cholasta <grubber at grubber cz>

_name=zdoom
pkgname=${_name}-git
pkgver=2.9pre+2175+g4f21ff275
pkgrel=1
pkgdesc='Advanced Doom source port (git version)'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'custom:BUILD' 'custom:doom' 'custom:dumb' 'LGPL')
depends=('hicolor-icon-theme'
         'libjpeg'
         'libgme'
         'libsndfile'
         'mpg123'
         'sdl2')
makedepends=('cmake'
             'desktop-file-utils'
             'fluidsynth'
             'git'
             'gtk3'
             'openal')
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
            'openal: in-game sound'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'timidity++: Timidity MIDI device'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git://github.com/rheit/${_name}.git"
        "${_name}.desktop")
sha256sums=('SKIP'
            'e8932a559baf30ecbfc062546ca014c6dfb70f76d1570549654209d39157e350')

pkgver() {
    cd $_name

    git describe --tags | sed -r 's/-/+/g'
}

build() {
    cd $_name

    cmake -DCMAKE_BUILD_TYPE=Release \
          -DNO_FMOD=ON \
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

    desktop-file-install --dir="$pkgdir"/usr/share/applications \
                         "$srcdir"/${_name}.desktop
    install -D -m644 src/posix/zdoom.xpm \
            "$pkgdir"/usr/share/icons/hicolor/48x48/apps/${_name}.xpm

    install -d "$pkgdir"/usr/share/licenses
    ln -s /usr/share/doc/$_name/licenses "$pkgdir"/usr/share/licenses/$pkgname
}
