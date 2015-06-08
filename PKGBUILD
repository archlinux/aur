# Based on mudlet-git package, all credist go there
# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-dev
pkgver=3.0delta
pkgrel=1
pkgdesc="Development prerelease of Mudlet"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('yajl' 'qt5-base' 'qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' 'lrexlib-pcre5.1')
makedepends=('boost' 'qt5-tools')
provides=('mudlet')
conflicts=('mudlet' 'mudlet-git' 'mudlet-deb')
source=("http://www.mudlet.org/download/Mudlet_3.0.0-delta.tar.bz2")
md5sums=('b0fc709e6cb4332168e9b5f77747668a')

prepare() {
    cd "$srcdir/src"
    sed -i 's,QString path = "../src/mudlet-lua/lua/LuaGlobal.lua";,QString path = "/usr/share/mudlet/lua/LuaGlobal.lua";,' TLuaInterpreter.cpp
    sed -i 's;"mudlet.app/Contents/Resources/mudlet-lua/lua/";"mudlet.app/Contents/Resources/mudlet-lua/lua/", "/usr/share/mudlet/lua/";' mudlet-lua/lua/LuaGlobal.lua
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
