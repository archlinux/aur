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
_pkgname=Mudlet
pkgver=3.22.1.r158.g3c8f12b6
pkgrel=1
pkgdesc="A modern MUD client with a graphical interface and Lua scripting (upstream dev branch)"
arch=('i686' 'x86_64')
url="https://github.com/Mudlet/Mudlet"
license=('GPL2')
depends=('hunspell' 'libzip' 'glu' 'lua51'
         'lua51-filesystem' 'luazip5.1' 'lua51-sql-sqlite' 'lrexlib-pcre5.1'
         'qt5-gamepad' 'lua51-utf8' 'lua51-lcf' 'ttf-font' 'pugixml' 'lua-yajl')
makedepends=('git' 'boost' 'qt5-tools')
provides=('mudlet')
conflicts=('mudlet' 'mudlet-dev' 'mudlet-deb')
source=("git+https://github.com/Mudlet/Mudlet.git#branch=development"
        "git+https://github.com/Mudlet/edbee-lib.git"
        "git+https://github.com/martin-eden/lua_code_formatter.git"
        "git+https://bitbucket.org/pentacent/dblsqd-sdk-qt.git"
        "git+https://github.com/Mudlet/mixing-cocoa-and-qt.git")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

pkgver() {
    cd "${_pkgname}/src"
    git describe --long --tags | sed 's/^Mudlet-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}/src"
    # Initialize required submodules for build
    git submodule init
    git config submodule."3rdparty/edbee-lib".url "${srcdir}/edbee-lib/.git"
    git config submodule."3rdparty/lua_code_formatter".url "${srcdir}/lua_code_formatter/.git"
    git config submodule."3rdparty/dblsqd".url "${srcdir}/dblsqd-sdk-qt/.git"
    git config submodule."3rdparty/sparkle-glue".url "${srcdir}/mixing-cocoa-and-qt/.git"
    git submodule update
}

build() {
    cd "${_pkgname}/src"
    WITH_FONTS=NO WITH_UPDATER=NO qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "${_pkgname}/src"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm 644 "${srcdir}/${_pkgname}/mudlet.desktop" "${pkgdir}/usr/share/applications/mudlet.desktop"
    install -Dm 644 "${srcdir}/${_pkgname}/mudlet.png" "${pkgdir}/usr/share/pixmaps/mudlet.png"
}
