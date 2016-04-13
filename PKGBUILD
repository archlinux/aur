# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Stanislav GE <ginermail at gmail dot com>

_pkgname="doublecmd"
pkgname=("${_pkgname}-gtk2-svn")
pkgver=r6754
pkgrel=1
pkgdesc="Twin-panel (commander-style) file manager (GTK)"
url="http://doublecmd.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2')
install="${_pkgname}-svn.install"
makedepends=('lazarus' 'fpc' 'subversion')
optdepends=(
    'lua51: scripting'
    'p7zip: support for 7zip archives'
    'libunrar: support for rar archives'
)
options=('!strip')
_svnmod="doublecmd-code"
provides=(${_pkgname}-gtk2)
conflicts=('doublecmd-gtk2' 'doublecmd-gtk2-alpha-bin' 'doublecmd-qt' 'doublecmd-qt-svn')
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
    cp -a "${srcdir}/${_svnmod}/" "${_pkgname}-gtk"
}

build() {
    msg 'Build GTK'
    gtkdir="${srcdir}/${_pkgname}-gtk"
    cd "${gtkdir}"
    bsdtar -zxf "${srcdir}/lazarus-20140321-2.tar.gz"
    sed -e "s/\\(export\\ lazbuild=\\).*/\\1\"\$(which lazbuild) --primary-config-path=${gtkdir//\//\\\/}\/lazarus\/lazarus-$CARCH\"/" -i build.sh
    sed -e "s/%%SRCDIR%%/${gtkdir//\//\\\/}/g" -i lazarus/packagefiles.xml
    ./build.sh beta gtk2
}

package() {
    cd "${srcdir}/${_pkgname}-gtk"
    ./install/linux/install.sh --install-prefix="${pkgdir}"
}

# vim:set ts=4 sw=2 ft=sh et: