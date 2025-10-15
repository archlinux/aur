# Maintainer: kinker31 <www.kinker31.com>
# A lot of this code was copied from Maddie (over at the uzdoom-git package)

pkgname=uzdoom-git
pkgver=4.15pre+487+gf30fc8d
pkgrel=1
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
arch=('x86_64')
url='https://github.com/UZDoom/UZDoom'
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
options=(!lto)
source=('uzdoom::git+https://github.com/UZDoom/UZDoom.git'
        '0001-Enforce-file-paths.patch')
sha256sums=('SKIP'
            'f9b5de60b4636b7de6a4c5434e4a320e145de9fb18e4d5d41334d575cf375811')

pkgver() {
    cd uzdoom
    git describe --tags --abbrev=7 --match '[Gg]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

## the "upstream broke again section" quick fix area!
## Force format-security errors to be bypassed.
# CFLAGS+=" -Wno-error=format-security"
# CXXFLAGS+=" -Wno-error=format-security"

prepare() {
    cd uzdoom
    patch -i "$srcdir"/0001-Enforce-file-paths.patch -p 1
}

build() {
    cd uzdoom
    mkdir -p build
    cmake -B build \
          -D CMAKE_BUILD_TYPE=Release \
          -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/uzdoom\\\"" \
          -D CMAKE_INSTALL_PREFIX=/usr \
          -D SYSTEMINSTALL=ON \
          -D INSTALL_PK3_PATH=share/uzdoom \
          -D INSTALL_SOUNDFONT_PATH=share/uzdoom \
          -D INSTALL_RPATH=/usr/lib \
          -D DYN_GTK=OFF \
          -D DYN_OPENAL=OFF \
          -D FORCE_INTERNAL_ZMUSIC=ON \
          -D BUILD_SHARED_LIBS=OFF \
          -G Ninja
    ninja -C build
}

package() {
    cd uzdoom
    DESTDIR="$pkgdir" ninja -C build install
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/uzdoom/licenses "$pkgdir"/usr/share/licenses/uzdoom
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/uzdoom.xpm
    ## workaround number 2, nuke CPPDAP system install because upstream CMAKE is broken
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/lib
}