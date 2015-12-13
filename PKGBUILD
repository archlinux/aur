# Maintainer: Elrond46 <elrond94 lol com>
# Old Maintainer: Zohar Malamant <dotfloat gmail com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Dmitry Shilov <stormblast@land.ru>

pkgname=doomsday
pkgver=1.15.6
pkgrel=2
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('doomsday2-unstable' 'i686-doomsday2-unstable')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'assimp' 'fluidsynth' 'soundfont-fluid' )
makedepends=('imagemagick')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("http://netcologne.dl.sourceforge.net/project/deng/Doomsday Engine/1.15.6/doomsday-stable-${pkgver}.tar.gz")
md5sums=('4d29064e940245cf407003e31867baba')

build() {
    # Fix annoying messages from libpng (thanks to jwm-art)
    find ${srcdir}/doomsday-stable-${pkgver}/snowberry/graphics/*.png -exec convert {} -strip {} \;

    # Force python2
    rm -rf ${srcdir}/python
    mkdir ${srcdir}/python
    ln -s /usr/bin/python2 ${srcdir}/python/python
    export PATH=${srcdir}/python:$PATH

    # Enter build directory
    cd ${srcdir}/doomsday-stable-${pkgver}/doomsday

    # Fix lib64 stuff
    sed 's/lib64/lib/g' -i macros.pri doomsday_sdk.pri

    # Hack for compiling fmodex libs
    echo -e "FMOD_DIR = \"${srcdir}/doomsday-stable-${pkgver}/doomsday/plugins/fmod\"" > config_user.pri
    ln -sf /usr/include/fmodex/* ${srcdir}/doomsday-stable-${pkgver}/doomsday/plugins/fmod/include/

    # Generate makefiles using qmake
    mkdir -p "${srcdir}/doomsday-stable-${pkgver}/build"
    cd "${srcdir}/doomsday-stable-${pkgver}/build"
    qmake-qt5 -r ../doomsday/doomsday.pro CONFIG+="deng_fmod deng_fluidsynth release"

    # Build
    make $MAKEFLAGS
}

package() {
    cd ${srcdir}/doomsday-stable-${pkgver}/build
    make INSTALL_ROOT=${pkgdir} install

    cat << 'EOF' > "${pkgdir}/usr/bin/launch-doomsday"
#!/usr/bin/env python2
import os, sys
os.chdir('/usr/share/doomsday/snowberry')
sys.path += '.'

import snowberry
EOF

    # Look for WADs in /usr/share/games/doom by default
    mkdir -p "${pkgdir}/etc/doomsday"
    echo "iwaddir: /usr/share/games/doom" > "${pkgdir}/etc/doomsday/paths"
    # For Music
    echo "To obtain music work properly, in options set show taskbar go to sound options of the engine and go to path /usr/share/soundfonts and choose your soundfont"
}
