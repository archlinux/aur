# Based on mudlet-git package, all credist go there
# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-dev
pkgver=3.0iota
pkgrel=1
pkgdesc="Development prerelease of Mudlet"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('yajl' 'qt5-base' 'qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' 'lrexlib-pcre5.1')
makedepends=('boost' 'qt5-tools')
provides=('mudlet')
conflicts=('mudlet' 'mudlet-git' 'mudlet-deb')
source=("http://www.mudlet.org/download/Mudlet_3.0.0-iota.tar.gz")
sha1sums=('9b3ca333b5084890c12a0b5df1281d5bd390ebc9')

prepare() {
    cd "$srcdir/src"
    sed -i 's,QString path = "../src/mudlet-lua/lua/LuaGlobal.lua";,QString path = "/usr/share/mudlet/lua/LuaGlobal.lua";,' TLuaInterpreter.cpp
    sed -i 's;"mudlet.app/Contents/Resources/mudlet-lua/lua/";"mudlet.app/Contents/Resources/mudlet-lua/lua/", "/usr/share/mudlet/lua/";' mudlet-lua/lua/LuaGlobal.lua

##Fix building with Qt 5.5+
    sed -i '/#include <QString>/ a #include <QDataStream>' ActionUnit.h
    sed -i '/#include <QTime>/ a #include <QDataStream>' ctelnet.h
}

build() {
    cd "$srcdir/src"
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
