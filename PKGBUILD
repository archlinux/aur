# Contributor: Archadept
#    Revision: 2020-12-04

# Package workarounds:
# 1 Requires cmake2 to compile
#   Updating the code to current standards would be desirable
# 2 Requires libpng14 to run
#   This one is fairly easy to fix since there is only couple of lines in one file in need of editing - OpenGLTexture.cpp
#   Unfortunately I know nothing about this changes so it remains not updated
# 3 Game doesn't support saving settings in home directory (per user). On each run game default settings are restored
#   This is the biggest problem with it and the fix was moving configuration files to var and granting write permissions
#   to everyone to these files. It is the only possible solution without modifying the code

#   If you like this little game and know how to remedy any of the above problems by correcting actual application rather than
#   fixing them in PKGBUILD you are encourage to post them so the game could easily and flawlessly support linux


pkgname=friking-shark-git
_gitname=friking-shark
pkgver=1.01beta
pkgrel=3
pkgdesc="Latest version of vertical shooter with upgrades to machine gun of a bomber fighter"
arch=('x86_64')
url="https://github.com/ptitSeb/friking-shark"
license=('GPL3')
makedepends=('git' 'cmake2')
depends=('libxinerama' 'libxrandr' 'freealut' 'libvorbis' 'glu' 'libpng14')
source=('git://github.com/ptitSeb/friking-shark.git' 'OpenGLTexture.cpp' 'frikingshark.desktop')
md5sums=('SKIP' 'b4ff7a43dd97aa7a4f5158311ddf0e5f' 'c6ae445d9227bd6b4c4e684ab6be73b0')

build() {
    cd "${srcdir}"

    rm -rf ${srcdir}/$_gitname-build
    cp -r ${_gitname} ${_gitname}-build || return 1

    cp $srcdir/OpenGLTexture.cpp $srcdir/${_gitname}-build/GameGraphics/
    cp $srcdir/frikingshark.desktop $srcdir/${_gitname}-build/Demo/Linux/

    cd ${_gitname}-build

    cmake-2 ./
    make -j 2
}

package () {
    cd ${_gitname}-build

    make DESTDIR="$pkgdir" install

    cd $pkgdir

    mkdir usr/bin
    mkdir usr/share

    mv usr/local/games/frikingshark usr/bin/
    mv usr/local/share/frikingshark usr/share/
    mv usr/local/share/applications usr/share/
    mv usr/local/share/pixmaps usr/share/
    mv usr/local/share/doc usr/share/

    chmod 755 usr/bin/frikingshark

    rm usr/local/share/menu/frikingshark

    rmdir usr/local/share/menu
    rmdir usr/local/games
    rmdir usr/share/frikingshark/Resources/BSPDebugger
    rmdir usr/share/frikingshark/Resources/IATestSystems
    rmdir usr/local/share
    rmdir usr/local

    # Game settings saving workaround
    # If for any reason you don't want it just comment it out by placing # mark at beginning of every line in section below
    # Game settings save section >>
    mkdir -p var/games/frikingshark/

    mv usr/share/frikingshark/Player/ var/games/frikingshark/

    chmod 775 -R var/games

    chown root:games -R var/games

    ln -s /var/games/frikingshark/Player usr/share/frikingshark/Player

    chmod 666 var/games/frikingshark/Player/HighScores.cfg
    chmod 666 var/games/frikingshark/Player/PlayerProfiles.cfg
    # Game settings save section <<
}
