# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-git
_gitname=Mudlet
pkgver=r1828.gce1845598
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting (git development branch"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt6-multimedia' 'qt6-5compat' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'lua51-luautf8'  'ttf-font' 'pugixml' 'lua-yajl' 'qtkeychain-qt6')
makedepends=('cmake' 'git' 'boost' 'qt6-tools')
optdepends=('ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font'
            'noto-fonts-emoji: emoji font support')
source=("git+https://github.com/Mudlet/Mudlet.git#branch=development")
sha256sums=('SKIP')
conflicts=('mudlet')
pkgver() {
    cd ${_gitname}
    git describe --long --tags| sed 's/^Mudlet-4.6.1.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}    

build() {
    cd "$srcdir/${_gitname}"
    mkdir -p build
    cd build
    export WITH_QT6=YES
    export WITH_FONTS=NO 
    export WITH_UPDATER=NO
    export WITH_OWN_QTKEYCHAIN=NO
    export XDG_DATA_DIRS=/usr

    cmake -DLUA_INCLUDE_DIR=/usr/include/lua5.1 .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd $srcdir/${_gitname}/build
    make "DESTDIR=${pkgdir}" install
    mkdir -p ${pkgdir}/usr/share/pixmaps/
    cd $srcdir/${_gitname}/
    install -m 644 icon_dev_1024x1204.png ${pkgdir}/usr/share/pixmaps/mudlet.png
}
