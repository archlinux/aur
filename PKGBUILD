# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Stanislav GE <ginermail at gmail dot com>

_pkgname="doublecmd"
pkgname=("${_pkgname}-qt-svn")
pkgver=r6754
pkgrel=1
pkgdesc="Twin-panel (commander-style) file manager (QT)"
url="http://doublecmd.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt4pas')
install="${_pkgname}-svn.install"
makedepends=('lazarus' 'fpc' 'subversion')
optdepends=(
    'lua51: scripting'
    'p7zip: support for 7zip archives'
    'libunrar: support for rar archives'
)
options=('!strip')
_svnmod="doublecmd-code"
provides=(${_pkgname}-qt)
conflicts=('doublecmd-qt' 'doublecmd-gtk2' 'doublecmd-gtk2-svn' 'doublecmd-gtk2-alpha-bin')
source=(
    "$_svnmod::svn+http://svn.code.sf.net/p/doublecmd/code/trunk"
    "http://www.herecura.be/files/lazarus-20140321-2.tar.gz"
)
sha256sums=(
    'SKIP'
    '16560ad7403ffbee1800384768828e1fad924d03068c6248b68a78c393fc4e20'
)


pkgver() {
    cd "${srcdir}/${_svnmod}/"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "${srcdir}/${_svnmod}/"
    sed -e 's/LIB_SUFFIX=.*/LIB_SUFFIX=/g' -i install/linux/install.sh

    cd "${srcdir}"
    cp -a "${srcdir}/${_svnmod}/" "${_pkgname}-qt"
}

build() {
    msg 'Build QT'
    qtdir="${srcdir}/${_pkgname}-qt"
    cd "${qtdir}"
    bsdtar -zxf "${srcdir}/lazarus-20140321-2.tar.gz"
    sed -e "s/\\(export\\ lazbuild=\\).*/\\1\"\$(which lazbuild) --primary-config-path=${qtdir//\//\\\/}\/lazarus\/lazarus-$CARCH\"/" -i build.sh
    sed -e "s/%%SRCDIR%%/${qtdir//\//\\\/}/g" -i lazarus/packagefiles.xml
    ./build.sh beta qt
}

package() {
    cd "${srcdir}/${_pkgname}-qt"
    ./install/linux/install.sh --install-prefix="${pkgdir}"
}

# vim:set ts=4 sw=2 ft=sh et: