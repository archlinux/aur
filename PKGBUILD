# Maintainer: Markus Hovorka <m.hovorka@live.de>

pkgname=freecad-netgen-git
pkgver=r8391.ae02a45
pkgrel=2
pkgdesc='A general purpose 3D CAD modeler'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'hicolor-icon-theme' 'libspnav' 'opencascade' 'med'
         'python2-pivy' 'python2-pyside' 'python2-shiboken' 'qtwebkit'
         'shared-mime-info' 'python2-pyside-tools' 'netgen-nogui' 'vtk-qt4')
makedepends=('git' 'xerces-c' 'boost' 'cmake' 'coin' 'desktop-file-utils'
             'eigen' 'gcc-fortran' 'swig' 'patch')
optdepends=('python2-matplotlib' 'pycollada-git' 'python2-pyqt4')
source=("$pkgname::git+https://github.com/FreeCAD/FreeCAD.git"
        "freecad.desktop"
	"freecad.xml"
	"mod-and-lib-path.patch")
md5sums=('SKIP'
         '21877b80638efa9269e8b1b1c391d407'
         'c2f4154c8e4678825411de8e7fa54c6b'
         '976f1674ce36b32108af8cb4d6e4e92d')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "$srcdir/mod-and-lib-path.patch"
}

build() {
	cd "$srcdir/$pkgname"

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
	      -DCMAKE_INSTALL_DOCDIR:PATH="share/doc/freecad" \
	      -DCMAKE_INSTALL_DATADIR:PATH="share/freecad" \
	      -DCMAKE_INSTALL_LIBDIR:PATH="lib/freecad" \
	      -DOCC_INCLUDE_DIR:PATH=/opt/opencascade/inc \
	      -DOCC_LIBRARY_DIR:PATH=/opt/opencascade/lib \
	      -DVTK_DIR:PATH=/opt/vtk-qt4/lib/cmake/vtk-7.0 \
	      -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	      -DPYSIDEUIC4BINARY:FILEPATH=/usr/bin/python2-pyside-uic \
	      -DBUILD_FEM_NETGEN=1

	make
}

package() {
	cd "$srcdir/$pkgname"

	make DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/Mod" "$pkgdir/usr/lib/freecad/Mod"

	# Install pixmaps and desktop shortcut
	desktop-file-install \
	  --dir="$pkgdir/usr/share/applications" "$srcdir/freecad.desktop"

	# Mime info
	install -D -m644 "$srcdir/freecad.xml" \
	  "$pkgdir/usr/share/mime/packages/freecad.xml"
}
