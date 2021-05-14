# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Elrond46 <elrond94 lol com>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Dmitry Shilov <stormblast@land.ru>

pkgname=doomsday
pkgver=2.3.1
pkgrel=3
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('doomsday-bin')
provides=('assimp')
depends=('hicolor-icon-theme' 'qt5-x11extras' 'sdl2_mixer' 'fluidsynth' 'openal' 'libxrandr' 'minizip')
makedepends=('imagemagick' 'cmake' 'xorg-server-devel' 'assimp' 'python')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware'
            'soundfont-fluid')
source=("http://files.dengine.net/archive/doomsday-$pkgver.tar.gz")
sha256sums=('feffcb792cf0f4e17f5bf9532f29e5963d6dd8b2872fc9bae10f53044548da04')

build() {
        
    # Enter build directory
    cd "$srcdir"/$pkgname-$pkgver/$pkgname

    # Generate makefiles using qmake
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	         -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver/$pkgname/build
    make install DESTDIR=""$pkgdir""

    # Delete the contents of /usr/include/assimp as this package already provides it
    rm -r "$pkgdir"/usr/include/assimp

    # Look for WADs in /usr/share/games/doom by default
    mkdir -p "${pkgdir}/etc/doomsday"
    echo "iwaddir: /usr/share/games/doom" > "${pkgdir}/etc/doomsday/paths"
    # For Music
    echo "Do not forget to start fluidsynth service after adding your soundfonts to etc/conf.d/fluidsynth (SOUND_FONT line) if you want to use fluidsynth music output"
}


