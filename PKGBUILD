# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-git
_gitname=Mudlet
pkgver=4.19.1.r2969.gfbb4799bd
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting (git development branch"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt6-multimedia' 'qt6-5compat' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'lua51-luautf8'  'ttf-font' 'pugixml' 'lua-yajl' 'qtkeychain-qt6' 'openmp')
makedepends=('cmake' 'git' 'boost' 'qt6-tools' 'assimp')
optdepends=('ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font'
            'noto-fonts-emoji: emoji font support')
source=("git+https://github.com/Mudlet/Mudlet.git#branch=development"
"GUIUtils-patch-0001.patch")
sha256sums=('SKIP'
'7d4ff78742fc3efa71818dfe8b441484527899a3810e4547e97fc4d7744e2833')
conflicts=('mudlet')
pkgver() {
    cd ${_gitname}
    ver=$(cat CMakeLists.txt | grep "APP_VERSION" | tail -1 | sed 's|set(APP_VERSION ||g' | sed 's|)||g')
    gver=$(git describe --long --tags| sed 's/^Mudlet-4.6.1.//;s/\([^-]*-g\)/r\1/;s/-/./g')
    echo "$ver.$gver"

}
prepare() {
    cd "$srcdir/${_gitname}"



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
    export assimp_DIR=/usr/lib/cmake/assimp-6.0/
    export USE_UPDATER=NO
    export USE_SHADER_HOT_RELOAD=YES

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
    mkdir -p ${pkgdir}/usr/share/mudlet/
    cp -r "$srcdir/${_gitname}"/src/mudlet-lua/lua "${pkgdir}"/usr/share/mudlet/

    # This is temporary. GUIUtils.lua is bugged, so ill leave these here until its fixed.
    cd "${pkgdir}"/usr/share/mudlet/lua
    cp GUIUtils.lua GUIUtils.orig.lua
    patch -p1 GUIUtils.lua < $srcdir/GUIUtils-patch-0001.patch
}
