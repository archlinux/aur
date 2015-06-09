# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Stanislav GE <ginermail at gmail dot com>

_pkgbase="doublecmd"
pkgbase="${_pkgbase}-svn"
pkgname=('doublecmd-gtk2-svn' 'doublecmd-qt-svn')
pkgver=6031
pkgrel=1
url="http://doublecmd.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
install="${pkgbase}.install"
provides=("doublecmd")
makedepends=('lazarus' 'qt4pas' 'gtk2' 'fpc' 'subversion')
optdepends=(
	'lua51: scripting'
	'p7zip: support for 7zip archives'
	'libunrar: support for rar archives'
)
options=('!strip')
_svnmod="doublecmd-code"
source=(
    "$_svnmod::svn+http://svn.code.sf.net/p/doublecmd/code/trunk"
	"http://www.herecura.be/files/lazarus-20140321-2.tar.gz"
)
sha256sums=(
	'SKIP'
	'16560ad7403ffbee1800384768828e1fad924d03068c6248b68a78c393fc4e20'
)

# pkgver autobump
pkgver() {
    cd "$SRCDEST/${_svnmod}"
	svnversion
}

prepare() {
    # Allow doublecmd to get subversion revision number while it is built
	cp -a "$SRCDEST/${_svnmod}/.svn" "${srcdir}/${_svnmod}/"

	cd "${srcdir}/${_svnmod}/"
	sed -e 's/LIB_SUFFIX=.*/LIB_SUFFIX=/g' -i install/linux/install.sh

	cd "${srcdir}"

	cp -a "${srcdir}/${_svnmod}/" "${_pkgbase}-gtk"
	cp -a "${srcdir}/${_svnmod}/" "${_pkgbase}-qt"
}

build() {
	msg2 'Build GTK'
	gtkdir="${srcdir}/${_pkgbase}-gtk"
	cd "${gtkdir}"
	bsdtar -zxf "${srcdir}/lazarus-20140321-2.tar.gz"
	sed -e "s/\\(export\\ lazbuild=\\).*/\\1\"\$(which lazbuild) --primary-config-path=${gtkdir//\//\\\/}\/lazarus\/lazarus-$CARCH\"/" -i build.sh
	sed -e "s/%%SRCDIR%%/${gtkdir//\//\\\/}/g" -i lazarus/packagefiles.xml
	./build.sh beta gtk2

	msg2 'Build QT'
	qtdir="${srcdir}/${_pkgbase}-qt"
	cd "${qtdir}"
	bsdtar -zxf "${srcdir}/lazarus-20140321-2.tar.gz"
	sed -e "s/\\(export\\ lazbuild=\\).*/\\1\"\$(which lazbuild) --primary-config-path=${qtdir//\//\\\/}\/lazarus\/lazarus-$CARCH\"/" -i build.sh
	sed -e "s/%%SRCDIR%%/${qtdir//\//\\\/}/g" -i lazarus/packagefiles.xml
	./build.sh beta qt
}

package_doublecmd-gtk2-svn() {
	pkgdesc="Twin-panel (commander-style) file manager (GTK)"
	depends=('gtk2')
	conflicts=('doublecmd-qt-svn' 'doublecmd-qt' 'doublecmd-gtk2' 'doublecmd-gtk2-bin-nightly')
	# OPTION 1
	# Install using official installation script
	cd "${srcdir}/${_pkgbase}-gtk"
	./install/linux/install.sh --install-prefix="${pkgdir}"
}

package_doublecmd-qt-svn() {
	pkgdesc="Twin-panel (commander-style) file manager (QT)"
	depends=('qt4pas')
	conflicts=('doublecmd-gtk2-svn' 'doublecmd-gtk2' 'doublecmd-qt' 'doublecmd-gtk2-bin-nightly')
	# OPTION 1
	# Install using official installation script
	cd "${srcdir}/${_pkgbase}-qt"
	./install/linux/install.sh --install-prefix="${pkgdir}"
}

# vim:set ts=4 sw=2 ft=sh et:
