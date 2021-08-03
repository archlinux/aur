# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=gzdoom-git
pkgver=4.7.0pre+91+gf89e6950c
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games (git version)'
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
provides=('gzdoom')
conflicts=('gzdoom')
replaces=('gzdoom1-git' 'gzdoom-legacy-git')
source=('gzdoom::git://github.com/coelckers/gzdoom.git'
        'gzdoom.desktop'
        '0001-Fix-file-paths.patch')
sha256sums=('SKIP'
            '59122e670f72aa2531aff370e7aaab2d886a7642e79e91f27a533d3b4cad4f6d'
            '7db3c08eb3756a19a9b6eda76f169e82e8c47b9a28108f17aac24774e2e53ff1')

pkgver() {
    cd gzdoom
    git describe --tags --match '[Gg]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

prepare() {
    cd gzdoom
    git submodule update --init
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
}

build() {
    cd gzdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/gzdoom\\\"" \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF
    make -C build
}

package() {
    cd gzdoom
    install build/gzdoom -t "$pkgdir"/usr/bin -D
    install build/{game_support,gzdoom}.pk3 -t "$pkgdir"/usr/lib/gzdoom -D -m 644
    desktop-file-install "$srcdir"/gzdoom.desktop --dir="$pkgdir"/usr/share/applications
    install docs/{console,rh-log,skins}.* -t "$pkgdir"/usr/share/doc/gzdoom -D -m 644
    install build/{brightmaps,game_widescreen_gfx,lights}.pk3 -t "$pkgdir"/usr/share/gzdoom -D -m 644
    install build/soundfonts/gzdoom.sf2 -t "$pkgdir"/usr/share/gzdoom/soundfonts -D -m 644
    install build/fm_banks/* -t "$pkgdir"/usr/share/gzdoom/fm_banks -D -m 644
    install src/posix/zdoom.xpm "$pkgdir"/usr/share/icons/hicolor/256x256/apps/gzdoom.xpm -D -m 644
    install docs/licenses/{bsd,fxaa,gdtoa,README}.* -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
