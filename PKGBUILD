# Contributer: Paramvir Likhari <plikhari at gmail dot com>
# Maintainer: Paramvir Likhari <plikhari at gmail dot com>


pkgname=tolua++_5.3
pkgver=1.0.93
pkgrel=1
pkgdesc='Provides tolua++ for 5.3 - This tool integrates C/C++ code with Lua 5.3 !!  - See this PKGBUILD source - Just change one variable to build the git version - defaults to release version.'
arch=('i686' 'x86_64')
url="https://github.com/LuaDist/toluapp"
license=('MIT')
depends=('lua')
options=('staticlibs')
conflicts=('tolua++')
provides=('tolua++')

### NOTE: Install conky-cairo from AUR - one of my other packages besides conkywx weather program

### change _myopts=0 to use git version
_myopts=1

case ${_myopts} in
0)  ### _myopts=0 for git version #####################################
    _pkgname=toluapp
    makedepends=('cmake' 'git')
    source=("git+${url}.git"
             'tolua53.patch')
    pkgver() {
        cd "${srcdir}/${_pkgname}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    }
    md5sums=('SKIP'
             '863770a6c505f2a76068d54f7aac1cd8')
    ;;
1)  ### _myopts=1 for release version #################################
    _pkgname="toluapp-${pkgver}"
    makedepends=('cmake' )
    source=(${url}/archive/${pkgver}.tar.gz
             'tolua53.patch')
    md5sums=('689d952034e55d4333fa240f7516e68a'
             '863770a6c505f2a76068d54f7aac1cd8')
    ;;
esac

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p3 -i ../tolua53.patch
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake \
        -D CMAKE_INSTALL_PREFIX=/usr \
        .

    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" install

    mkdir -p ${pkgdir}/usr/share/toluapp/luapp
    install -D -m755 src/bin/lua/* ${pkgdir}/usr/share/toluapp/luapp/
    install -Dm644 "$srcdir/${_pkgname}/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
