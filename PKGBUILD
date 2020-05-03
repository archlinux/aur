# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-git
_gitname=Mudlet
pkgver=Mudlet.4.6.1.r218.g102491a74
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting (git development branch"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'qt5-gamepad' 'lua51-utf8'  'ttf-font' 'pugixml' 'lua-yajl' 'qtkeychain')
makedepends=('git' 'boost' 'qt5-tools')
optdepends=('discord-rpc-api: discord integration'
            'ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font'
            'noto-fonts-emoji: emoji font support')
conflicts=('mudlet')
replaces=('mudlet')
source=("git+https://github.com/Mudlet/Mudlet.git#branch=development")
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_gitname}/src"
    export XDG_DATA_DIRS=/usr/share
    export WITH_FONTS=NO 
    export WITH_UPDATER=NO
    export WITH_OWN_QTKEYCHAIN=NO
    
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd $srcdir/${_gitname}/src
    make INSTALL_ROOT="$pkgdir" install    
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps
    install -m 644 ../mudlet.desktop ${pkgdir}/usr/share/applications
    install -m 644 ../mudlet.svg ${pkgdir}/usr/share/pixmaps   
}
