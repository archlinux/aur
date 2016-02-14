# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=freecad-greyltc-git
pkgver=1
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - git checkout of greltc'\''s repo'
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
conflicts=('freecad' 'freecad-git')
source=('freecad::git://github.com/greyltc/FreeCAD')
sha256sums=('SKIP')

PKGEXT='.pkg.tar'

pkgver() {
  cd freecad/
  echo $(git describe --tags --abbrev=0)
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

	# install the desktop icon
	install -m644 -D ${srcdir}/freecad/src/Gui/Icons/freecad.svg -t ${pkgdir}/usr/share/icons

	# Install pixmaps and desktop shortcut
	desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/freecad/package/debian/freecad.desktop"
}

