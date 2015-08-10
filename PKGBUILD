# Maintainer: Zohar Malamant <dotfloat gmail com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Dmitry Shilov <stormblast@land.ru>

pkgname=doomsday
pkgver=1.15.0
pkgrel=2
_buildnum=1616
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'assimp')
makedepends=('imagemagick')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("http://code.iki.fi/builds/build${_buildnum}/doomsday-stable-${pkgver}.tar.gz")
md5sums=('027e76fd6ac778c37a96d64ab9c11dfa')

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
    qmake-qt5 -r ../doomsday/doomsday.pro CONFIG+="deng_fmod release"

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
}
