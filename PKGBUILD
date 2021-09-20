# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-git
_gitname=Mudlet
pkgver=r1143.g68133f54b
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting (git development branch"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'qt5-gamepad' 'lua51-luautf8'  'ttf-font' 'pugixml' 'lua-yajl' 'qtkeychain-qt5')
makedepends=('git' 'boost' 'qt5-tools')
optdepends=('discord-rpc-api: discord integration'
            'ttf-bitstream-vera: default font'
            'ttf-ubuntu-font-family: default font'
            'noto-fonts-emoji: emoji font support')
source=("git+https://github.com/Mudlet/Mudlet.git#branch=development")
sha256sums=('SKIP')

pkgver() {
    cd ${_gitname}
    git describe --long --tags| sed 's/^Mudlet-4.6.1.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}    

build() {
    cd "$srcdir/${_gitname}/src"

    export WITH_FONTS=NO 
    export WITH_UPDATER=NO
    export WITH_OWN_QTKEYCHAIN=NO
    export XDG_DATA_DIRS=/opt/mudlet
    
    qmake-qt5 PREFIX=/opt/mudlet
    make
}

package() {
    cd $srcdir/${_gitname}/src
    make INSTALL_ROOT="$pkgdir" install    
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps
    mkdir -p ${pkgdir}/usr/bin
    sed -i 's;mudlet;mudlet-git;' ../mudlet.desktop
    sed -i 's;Exec=mudlet-git;Exec=/opt/mudlet/bin/mudlet;' ../mudlet.desktop
    sed -i 's;Mudlet;Mudlet (dev);' ../mudlet.desktop
    mv ../mudlet.desktop ../mudlet-git.desktop
    install -m 644 ../mudlet-git.desktop ${pkgdir}/usr/share/applications/
    mv icons/mudlet_dev_256px.png icons/mudlet-git.png
    install -m 644 icons/mudlet-git.png ${pkgdir}/usr/share/pixmaps/ 
}
