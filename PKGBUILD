# Maintainer: Gustavo Rehermann <rehermann6046 at gmail dot com>
# Contributor: Jan Cholasta <grubber at grubber dot cz>

pkgname=lzdoom-git
pkgver=3.4.1v+2588+g43865c1947
pkgrel=2
pkgdesc='Fork of legacy versions of the GZDoom source port for older hardware; cutting edge Git version'
arch=('i686' 'x86_64')
url='http://www.zdoom.org/'
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'openal'
         'sdl2'
         'zmusic>=1.1.1')
makedepends=('cmake' 'desktop-file-utils' 'git')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedm: FreeDM game data'
            'freedoom1: Freedoom: Phase 1 game data'
            'freedoom2: Freedoom: Phase 2 game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
optdepends_x86_64=('vulkan-driver: Vulkan renderer'
                   'vulkan-icd-loader: Vulkan renderer')
provides=('lzdoom')
conflicts=('lzdoom' 'lzdoom-bin')
# WIP: set back to 'master' once g3.3mgw is merged
source=('gzdoom::git://github.com/drfrag666/gzdoom.git#branch=g3.3mgw'
        'lzdoom.desktop')
sha256sums=('SKIP'
            'd65aabafadf1d466cc6cc635b4765b069dce2cef628d4d1c33878297af509d60')

pkgver() {
    cd gzdoom
    git describe --tags --match '[Gg]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

prepare() {
    cd gzdoom
    git submodule update --init
}

build() {
    cd gzdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/lzdoom\\\"" \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF
    make -C build
}

package() {
    cd gzdoom
    install build/gzdoom -t "$pkgdir"/usr/bin -D
    install build/{game_support,gzdoom}.pk3 -t "$pkgdir"/usr/lib/lzdoom -D -m 644
    desktop-file-install "$srcdir"/lzdoom.desktop --dir="$pkgdir"/usr/share/applications
    install docs/{console,rh-log,skins}.* -t "$pkgdir"/usr/share/doc/lzdoom -D -m 644
    install build/{brightmaps,game_widescreen_gfx,lights}.pk3 -t "$pkgdir"/usr/share/lzdoom -D -m 644
    install build/soundfonts/gzdoom.sf2 -t "$pkgdir"/usr/share/lzdoom/soundfonts -D -m 644
    install build/fm_banks/* -t "$pkgdir"/usr/share/lzdoom/fm_banks -D -m 644
    install src/posix/zdoom.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/lzdoom.xpm -D -m 644
    install docs/licenses/{bsd,fxaa,gdtoa,README}.* -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
