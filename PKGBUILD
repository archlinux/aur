# Maintainer: Maddie Mewmews <maddie at mewmews gay>
# Contributor: Jan Cholasta <grubber at grubber cz>

pkgname=vkdoom-git
pkgver=v25.6.0+585+g20997f7a1
pkgrel=2
pkgdesc='Feature centric port for all Doom engine games, with a focus on Vulkan and modern computers (git version)'
arch=('x86_64' 'aarch64') #Ok so aarch64 works i guess
url='https://git.sayachan.org/OrdinaryMagician/vkdoom_m'
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2'
         'gtk3'
         'hicolor-icon-theme'
         'libgl'
         'libvpx>=1.14'
         'openal'
         'sdl2'
         'vulkan-driver'
         'vulkan-icd-loader')
makedepends=('cmake' 'desktop-file-utils' 'git' 'ninja')
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
            'xorg-xmessage: crash dialog (other)'
            'zmusic-git: System-level ZMusic instead of static compile (requires cmake option change)')
provides=('vkdoom' 'vkdoom-bin-nightly')
conflicts=('vkdoom' 'vkdoom-bin-nightly')
#disable LTO due to instability
options=(!debug !lto)
source=('vkdoom::git+https://git.sayachan.org/OrdinaryMagician/vkdoom_m.git'
        'org.vkdoom.vkdoom.desktop'
        '0001-Enforce-file-paths.patch')
        
sha256sums=('SKIP'
            'e1ff11673e11df9b752a30f16d573bf7b555f12048dbb5ec364cf8f81ef47daf'
            'f9b5de60b4636b7de6a4c5434e4a320e145de9fb18e4d5d41334d575cf375811')

_enforce_clang=${_enforce_clang-}

if [ -n "$_enforce_clang" ]; then
    makedepends+=(clang llvm lld)
fi

pkgver() {
    cd vkdoom
    git describe --tags --match '[Vv]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

## the "upstream broke again section" quick fix area!

## Force format-security errors to be bypassed.
# CFLAGS+=" -Wno-error=format-security"
# CXXFLAGS+=" -Wno-error=format-security"

prepare() {
    cd vkdoom
    patch -i "$srcdir"/0001-Enforce-file-paths.patch -p 1
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
            -D FORCE_INTERNAL_ZMUSIC=ON \
            -D BUILD_SHARED_LIBS=OFF \
            -D CMAKE_C_COMPILER="/usr/bin/clang" \
            -D CMAKE_CXX_COMPILER="/usr/bin/clang++" \
            -G Ninja
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
            -D DYN_OPENAL=OFF \
            -D FORCE_INTERNAL_ZMUSIC=ON \
            -D BUILD_SHARED_LIBS=OFF \
            -G Ninja
    fi
    ninja -C build
}

package() {
    cd vkdoom
    DESTDIR="$pkgdir" ninja -C build install
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/share/doc/vkdoom/licenses "$pkgdir"/usr/share/licenses/vkdoom
    desktop-file-install "$srcdir"/org.vkdoom.vkdoom.desktop --dir="$pkgdir"/usr/share/applications
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/vkdoom.xpm
    install src/posix/unix/org.vkdoom.vkdoom.svg -D -m 644 "$pkgdir"/usr/share/pixmaps/org.vkdoom.vkdoom.svg
    install src/posix/unix/org.vkdoom.vkdoom.metainfo.xml -D -m 644 "$pkgdir"/usr/share/metainfo/org.vkdoom.vkdoom.metainfo.xml
    ## workaround number 2, nuke CPPDAP system install because upstream CMAKE is broken
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/lib
    #remove GZDoom freedesktop files that are still in here for some reason
    rm -f "$pkgdir"/usr/share/applications/org.zdoom.GZDoom.desktop
    rm -f "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.zdoom.GZDoom.svg
    rm -f "$pkgdir"/usr/share/metainfo/org.zdoom.GZDoom.metainfo.xml
    rm -f "$pkgdir"/usr/share/mime/packages/org.zdoom.GZDoom-mime.xml

}
