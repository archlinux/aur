# Previous Maintainers of Mudlet-git
# Contributor: A. Fluteaux <sigma_g (at) melix (dot) net>
# Contributor: Elmo Tudurov <tudurov+arch (at) gmail (dot) com>
# Contributor: strata <strata (at) dropswitch (dot) net>

# Based on mudlet and mudlet-dev by Xabre et al.
# Contributor: Jaroslav Lichtblau <dragonlord (at) aur.archlinux (dot) org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Ryon Sherman <ryon.sherman (at) gmail (dot) com>
# Contributor: Dardo Marasca <gefarion (at) gmail (dot) com>
# Contributor: Kevin Kyzer <kev (at) k3v (dot) in>
# Contributor: Xabre <xabre (at) archlinux (dot) info>
# Maintainer: WSDMatty <wsdmatty (at) gmail (dot) com>

pkgname=mudlet-git
pkgver=3.22.1.r153.gadb14133
pkgrel=1
pkgdesc="A modern MUD client with a graphical interface and Lua scripting (upstream dev branch)"
_branch="development"
arch=('i686' 'x86_64')
url="https://github.com/Mudlet/Mudlet"
license=('GPL2')
depends=('hunspell' 'libzip' 'glu' 'lua51' \
         'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' 'lrexlib-pcre5.1'  \
         'qt5-gamepad' 'lua51-utf8' 'lua51-lcf' 'ttf-font' 'pugixml' 'lua-yajl')
makedepends=('git' 'boost' 'qt5-tools')
provides=('mudlet')
conflicts=('mudlet' 'mudlet-dev' 'mudlet-deb')
source=("$pkgname::git+$url.git#branch=$_branch")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname/src"
    git describe --long --tags | sed 's/^Mudlet-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname/src"
    # Initialize required submodules for build
    git submodule update --init --recursive
    sed -i 's;"mudlet.app/Contents/Resources/mudlet-lua/lua/";"mudlet.app/Contents/Resources/mudlet-lua/lua/", "/usr/share/mudlet/lua/";' mudlet-lua/lua/LuaGlobal.lua

##Fix building with Qt 5.5+
    sed -i '/#include <QString>/ a #include <QDataStream>' ActionUnit.h
    sed -i '/#include <QTime>/ a #include <QDataStream>' ctelnet.h
}

build() {
    cd "$srcdir/$pkgname/src"
    WITH_FONTS=NO WITH_UPDATER=NO qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname/src"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm 644 $srcdir/$pkgname/mudlet.desktop ${pkgdir}/usr/share/applications/mudlet.desktop
    install -Dm 644 $srcdir/$pkgname/mudlet.png ${pkgdir}/usr/share/pixmaps/mudlet.png
}
