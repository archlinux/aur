# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=gzdoom-git
pkgver=4.15pre+487+gf30fc8d
pkgrel=2
pkgdesc='Feature centric port for all Doom engine games (git version)'
arch=('i686' 'x86_64' 'aarch64')
url='http://www.zdoom.org/'
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2'
         'gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libvpx>=1.14'
         'openal'
         'sdl2')
makedepends=('cmake' 'desktop-file-utils' 'git' 'ninja')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'chexquest3-wad: Chex Quest 3 game data'
            'doom1-wad: Doom shareware game data'
            'freedm: FreeDM game data'
            'freedoom: Freedoom game data'
            'gxmessage: crash dialog (GNOME)'
            'hacx-wad: HacX game data'
            'harmony-wad: Harmony game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data'
            'kdialog: crash dialog (KDE)'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)'
            'zmusic-git: System-level ZMusic instead of static compile (requires cmake option change)')
optdepends_x86_64=('vulkan-driver: Vulkan renderer'
                   'vulkan-icd-loader: Vulkan renderer')
provides=('gzdoom')
conflicts=('gzdoom')
replaces=('gzdoom1-git' 'gzdoom-legacy-git')
options=(!lto)
source=('gzdoom::git+https://github.com/coelckers/gzdoom.git'
        '0001-Enforce-file-paths.patch')
sha256sums=('SKIP'
            'f9b5de60b4636b7de6a4c5434e4a320e145de9fb18e4d5d41334d575cf375811')

pkgver() {
    cd gzdoom
    git describe --tags --abbrev=7 --match '[Gg]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

## the "upstream broke again section" quick fix area!

## Force format-security errors to be bypassed.
# CFLAGS+=" -Wno-error=format-security"
# CXXFLAGS+=" -Wno-error=format-security"

prepare() {
    cd gzdoom
    patch -i "$srcdir"/0001-Enforce-file-paths.patch -p 1
}

build() {
    cd gzdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/gzdoom\\\"" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D SYSTEMINSTALL=ON \
          -D INSTALL_PK3_PATH=share/gzdoom \
          -D INSTALL_SOUNDFONT_PATH=share/gzdoom \
          -D INSTALL_RPATH=/usr/lib \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF \
          -D FORCE_INTERNAL_ZMUSIC=ON \
          -D BUILD_SHARED_LIBS=OFF \
          -G Ninja
    ninja -C build
}

package() {
    cd gzdoom
    DESTDIR="$pkgdir" ninja -C build install
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/gzdoom/licenses "$pkgdir"/usr/share/licenses/gzdoom
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/gzdoom.xpm
    ## workaround number 2, nuke CPPDAP system install because upstream CMAKE is broken
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/lib
}
