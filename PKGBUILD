# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=freecad-git
pkgver=0.16.pre.r3.g192dca3
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'opencascade>=6.6.0' 'python2-pivy' 'xerces-c'
	'libspnav' 'shared-mime-info' 'hicolor-icon-theme'
	'python2-matplotlib' 'python2-shiboken' 'python2-pyside' 'qtwebkit')
makedepends=('git' 'boost' 'eigen' 'gcc-fortran' 'swig' 'desktop-file-utils'
	'cmake' 'coin' 'python2-pyside-tools')
optdepends=('freecad-dxf: import DXF files'
	'pycollada-git: create, edit and load COLLADA documents')
provides=('freecad')
conflicts=('freecad')
install=freecad.install
source=('freecad::git://github.com/FreeCAD/FreeCAD'
	'freecad.desktop'
	'freecad.xml')
sha256sums=('SKIP'
	'886688f1f3624fafe92710890bda7504d1e0181c2c5239b313066eb412a78e0f'
	'248918de7d3c2145b5cc4fbbc9e224d22f4a6ca7ead2680e8c3a32e91772482a')

pkgver() {
	cd freecad/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	sed -i \
		-e "46i\\\tModDir = '/usr/share/freecad/Mod'" \
		-e "50i\\\tLibDir = '/usr/lib/freecad'" \
		"${srcdir}/freecad/src/App/FreeCADInit.py"
}

build() {
	cd freecad/
	mkdir -p build
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DCMAKE_INSTALL_DOCDIR:PATH="share/freecad/doc" \
		-DCMAKE_INSTALL_DATADIR:PATH="share/freecad" \
		-DCMAKE_INSTALL_LIBDIR:PATH="lib/freecad" \
		-DOCC_INCLUDE_DIR:PATH=/opt/opencascade/inc/ \
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
		-DPYSIDEUIC4BINARY:FILEPATH=/usr/bin/python2-pyside-uic \
		-DFREECAD_USE_EXTERNAL_PIVY:BOOL=ON

	make
}

package() {
	cd freecad/build/

	make DESTDIR="${pkgdir}" install

	# Symlink to /usr/bin
	ln -sf "FreeCAD" "${pkgdir}/usr/bin/freecad"
	ln -sf "FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"

	cp -ra "${pkgdir}/usr/Mod" "${pkgdir}/usr/share/freecad/"
	rm -r "${pkgdir}/usr/Mod"

	# Install pixmaps and desktop shortcut
	desktop-file-install \
		--dir="${pkgdir}/usr/share/applications" \
		"${srcdir}/freecad.desktop"

	# Mime info
	install -D -m644 "${srcdir}/freecad.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}

