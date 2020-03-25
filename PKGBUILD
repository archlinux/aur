# Contributor: Xabre <xabre @archlinux.info>
pkgname=mudlet-git
_gitname=Mudlet
pkgver=4137_Mudlet.4.6.1.77.g819757d4a_2020.03.25
pkgrel=1
pkgdesc="A modern MUD client with a graphical user inteface and built in Lua scripting (git development branch"
arch=('i686' 'x86_64')
url="http://www.mudlet.org"
license=('GPL')
depends=('qt5-multimedia' 'hunspell' 'libzip' 'glu' 'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' \
         'lrexlib-pcre5.1' 'qt5-gamepad' 'lua51-utf8'  'ttf-font' 'pugixml' 'lua-yajl')
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
    _tag=$(git describe --tags | sed 's:^v::') # tag is mobile, and switches between numbers and letters, can't use it for versioning
    _commits=$(git rev-list --count HEAD) # total commits is the most sane way of getting incremental pkgver
    _date=$(git log -1 --date=short --pretty=format:%cd)
    printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
    cd "$srcdir/${_gitname}/src"
    export XDG_DATA_DIRS=/usr/share
    export WITH_FONTS=NO 
    export WITH_UPDATER=NO 
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
