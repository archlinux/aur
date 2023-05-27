# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=zdoom-git
pkgver=2.9pre+2176+gd44976175
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
provides=('zdoom')
conflicts=('zdoom')
source=('zdoom::git+https://github.com/rheit/zdoom.git'
        'zdoom.desktop'
        '0001-Fix-file-paths.patch'
        '0002-Fix-compilation.patch')
sha256sums=('SKIP'
            'e8932a559baf30ecbfc062546ca014c6dfb70f76d1570549654209d39157e350'
            '02f3da08b3c08be89eeb149fb2be45087ef4a86f5b634e9dac8075c864acc962'
            '09a27450988d259a82b5fa056e1c58c89f57eab287d873af65e39c6d30789a5d')

pkgver() {
    cd zdoom
    git describe --tags | sed -r 's/-/+/g'
}

prepare() {
    cd zdoom
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
    patch -i "$srcdir"/0002-Fix-compilation.patch -p 1
}

build() {
    cd zdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D NO_FMOD=ON \
          -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/zdoom\\\"" \
          -D CMAKE_EXE_LINKER_FLAGS="$LDFLAGS -Wl,-z,noexecstack" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D INSTALL_PATH=bin \
          -D INSTALL_PK3_PATH=share/zdoom \
          .
    make -C build
}

package() {
    cd zdoom
    make -C build install DESTDIR="$pkgdir"
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/zdoom/licenses "$pkgdir"/usr/share/licenses/zdoom
    desktop-file-install "$srcdir"/zdoom.desktop --dir="$pkgdir"/usr/share/applications
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zdoom.xpm
}
