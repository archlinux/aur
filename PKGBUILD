# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ryon Sherman <ryon.sherman@gmail.com>
# Contributor: Dardo Marasca <gefarion@gmail.com>
# Contributor: Kevin Kyzer <kev@k3v.in>
# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet
pkgver=4.4.0
pkgrel=2
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51' \
         'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' 'lrexlib-pcre5.1'  \
         'qt5-gamepad' 'lua51-utf8'  'ttf-font' 'pugixml' 'lua-yajl')
makedepends=('boost' 'qt5-tools')
optdepends=('discord-rpc-api: discord integration'
            'ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font')
conflicts=('mudlet-git')
#source=("http://www.mudlet.org/download/Mudlet-${pkgver}.tar.xz")
##using alternate link
source=("https://www.mudlet.org/wp-content/files/Mudlet-${pkgver}.tar.xz")
sha256sums=('4496d1ab8cdbec8bebf4932b7cbd64df5318d01e591ca4cb1d65cfbfd2401c70')

prepare() {
    cd "$srcdir/src"
    #Fix missing includes
    sed -i '29 a #include <QFileInfo>' TMedia.h
    sed -i '29 a #include <QJsonDocument>' TMedia.h
    sed -i '29 a #include <QJsonObject>' TMedia.h
    sed -i '29 a #include <QDir>' TMedia.h
    sed -i '29 a #include <QStandardPaths>' TMedia.h 
    sed -i '29 a #include <QNetworkAccessManager>' TMedia.h 
    sed -i '29 a #include <QNetworkDiskCache>' TMedia.h
    }


build() {
    cd "$srcdir/src"
    export XDG_DATA_DIRS=/usr/share
    export WITH_FONTS=NO 
    export WITH_UPDATER=NO 
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd $srcdir/src
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/mudlet/lua/geyser
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps

    install -m 755 mudlet ${pkgdir}/usr/bin/mudlet
    install -m 644 mudlet-lua/lua/*.lua ${pkgdir}/usr/share/mudlet/lua
    install -m 644 mudlet-lua/lua/geyser/* ${pkgdir}/usr/share/mudlet/lua/geyser
    install -m 644 ../mudlet.desktop ${pkgdir}/usr/share/applications
    install -m 644 ../mudlet.png ${pkgdir}/usr/share/pixmaps
}
