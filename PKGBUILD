# Maintainer: Brent Spillner <spillner@a c m . o r g>
pkgname=doomsday-git
pkgver=cmake.build.1.15.r4477.g3166d4bfd4
pkgrel=1
pkgdesc="Modern engine for DOOM and related games (git version, supports Wayland)"
arch=('i686' 'x86_64')
url="https://dengine.net"
license=('GPL')
_gitname="Doomsday-Engine"
source=(${_gitname}::git+https://github.com/skyjake/Doomsday-Engine.git)
sha256sums=('SKIP')
depends=( assimp curl fluidsynth glbinding hicolor-icon-theme libunistring ncurses openal pcre2 sdl2 sdl2_mixer zlib )
optdepends=('doom1-wad: Shareware data for the original DOOM')
provides=( lib_Foundation.so libdeng_core.so libdeng_doom64.so libdeng_doomsday.so libdeng_doom.so libdeng_gamekit.so libdeng_gloom.so libdeng_gui.so libdeng_heretic.so libdeng_hexen.so )

prepare() {
    if [ -e ~/.doomsday/build_deps ] ; then
        # Doomsday remembers its last build directory in a per-user configuration
        # file; this can cause unexpected behavior for users experimenting with
        # multiple source versions.
        echo Found existing ~/.doomsday/build_deps file
        olddir=`cat ~/.doomsday/build_deps | cut -d: -f3 | cut -d\" -f2`
        depdir=${srcdir}/${_gitname}
        if [ "$olddir" != "$depdir/deps" ]; then
            echo WARNING: ~/.doomsday/build_deps sets dependency dir $olddir
            echo This script pulls source into $srcdir
            echo The discrepancy almost certainly isn\'t what you want
            echo Press ^C to abort the build, or Enter to continue:
            read
        fi
    fi
    cd ${srcdir}/${_gitname}/doomsday
}

pkgver() {
  cd ${srcdir}/${_gitname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
    cd ${srcdir}/${_gitname}
    if [[ -d build ]]; then
       echo "Removing existing build directory!" 
       rm -rf build
    fi
    python3 doomsday/build/scripts/build_deps.py --skip-glbinding --skip-assimp build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DDE_USE_SYSTEM_ASSIMP=1 -DDE_USE_SYSTEM_GLBINDING=1 -B build -Wno-dev .
    cmake --build build
}

package() {
  cd "$srcdir/${_gitname}/build"
  make DESTDIR="$pkgdir/" install

  # "The Foundation" library doesn't have an Arch or AUR package, and doesn't seem worthy of one,
  # but it is required to run the doomsday binary.  The other in-tree dependencies (assimp, glbinding)
  # are provided by Arch community packages.
  cp -a ../deps/the_Foundation/build/lib_Foundation.so* "$pkgdir/usr/lib"
}
