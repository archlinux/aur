# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=vkdoom-git
pkgver=v0.9+238+g9715f2891
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games, with a focus on Vulkan and modern computers (git version)'
arch=('x86_64' 'aarch64') #Ok so aarch64 works i guess
url='https://vkdoom.org/'
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libjpeg'
         'libvpx>=1.13'
         'openal'
         'sdl2'
         'vulkan-driver'
         'vulkan-icd-loader'
         'zmusic>=1.1.8')
makedepends=('cmake' 'desktop-file-utils' 'git')
optdepends=('blasphemer-wad: Blasphemer (free Heretic) game data'
            'clang: Clang build option support'
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
            'lld: Clang build option dependency'
            'strife0-wad: Strife shareware game data'
            'square1-wad: The Adventures of Square, Episode 1 game data'
            'urbanbrawl-wad: Urban Brawl: Action Doom 2 game data'
            'xorg-xmessage: crash dialog (other)')
provides=('vkdoom')
conflicts=('vkdoom')
source=('vkdoom::git+https://github.com/dpjudas/VkDoom/'
        'vkdoom.desktop'
        '0001-Fix-file-paths.patch')
b2sums=('SKIP'
            '66d946f4deb49d0f655c889280677cdd489d4e1d8c2bc67ec635f667b316dff611f4a6a18521e0029f25031282e1cf781d0799db487481478d5ab89ba1e9b266'
            'fbec476e07feadccbe60fe8059f063fc810fbc3ca5fcfc57c05baa5b2bb75e46408e7462ba23ca0a993ffc0662e0e5fb77edd731300e526bd0c00e71e8897ec6')

_enforce_clang=${_enforce_clang-}

if [ -n "$_enforce_clang" ]; then
    makedepends+=(clang llvm lld)
fi

pkgver() {
    cd vkdoom
    git describe --tags --match '[Vv]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

prepare() {
    cd vkdoom
    patch -i "$srcdir"/0001-Fix-file-paths.patch -p 1
}

build() {
    cd vkdoom
    mkdir -p build
    if [ -n "$_enforce_clang" ]; then
        echo "Building VkDoom with Clang..."
        cmake -B build \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/vkdoom\\\"" \
            -D CMAKE_INSTALL_PREFIX=/usr \
            -D SYSTEMINSTALL=ON \
            -D INSTALL_PK3_PATH=share/vkdoom \
            -D INSTALL_SOUNDFONT_PATH=share/vkdoom \
            -D INSTALL_RPATH=/usr/lib \
            -D DYN_GTK=OFF \
            -D DYN_OPENAL=OFF \
            -D CMAKE_C_COMPILER="/usr/bin/clang" \
            -D CMAKE_CXX_COMPILER="/usr/bin/clang++"
    else
        echo "Building VkDoom with System Compiler..."
        cmake -B build \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffile-prefix-map=\"$PWD\"=. -DSHARE_DIR=\\\"/usr/share/vkdoom\\\"" \
            -D CMAKE_INSTALL_PREFIX=/usr \
            -D SYSTEMINSTALL=ON \
            -D INSTALL_PK3_PATH=share/vkdoom \
            -D INSTALL_SOUNDFONT_PATH=share/vkdoom \
            -D INSTALL_RPATH=/usr/lib \
            -D DYN_GTK=OFF \
            -D DYN_OPENAL=OFF
    fi
    make -C build
}

package() {
    cd vkdoom
    make -C build install DESTDIR="$pkgdir"
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/vkdoom/licenses "$pkgdir"/usr/share/licenses/vkdoom
    desktop-file-install "$srcdir"/vkdoom.desktop --dir="$pkgdir"/usr/share/applications
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vkdoom.xpm
}
