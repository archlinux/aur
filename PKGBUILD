# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributer: Christian Hesse <mail@eworm.de>

pkgname=freecad-qt5-git
pkgver=0.17pre.r3684.gf560398f3
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'hicolor-icon-theme' 'libspnav' 'opencascade'
         'med' 'xerces-c' 'python2-pivy' 'python2-pyside2-git' 'qt5.6-webkit'
	 'libtheora' 'shared-mime-info' 'vtk' 'jsoncpp')
makedepends=('git' 'boost' 'cmake' 'coin' 'python2-pyside2-tools-git'
             'desktop-file-utils' 'eigen' 'gcc-fortran' 'swig' 'patch')
optdepends=('python2-matplotlib'
            'pycollada-git: Create, edit and load COLLADA documents.')
source=("$pkgname::git+https://github.com/FreeCAD/FreeCAD.git"
        "FreeCAD-Qt5"
        "FreeCADCmd-Qt5"
        "freecad-qt5.desktop"
	"freecad-qt5.xml"
	"rpath.patch")
md5sums=('SKIP'
         '20043b18348679526cf17853cb08f42e'
         '5fe6884bb663b157c8c24f9b00da5337'
         'cb6691e33df31199ea93d4f309a86e54'
         'c2f4154c8e4678825411de8e7fa54c6b'
         'b313a990287bce43dc698affae35d58d')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
    cd "$srcdir/$pkgbase"
    patch -Np1 -i "$srcdir/rpath.patch"
}

build() {
	cd "$srcdir/$pkgname"

	cmake -DCMAKE_BUILD_TYPE=Debug \
	      -DCMAKE_INSTALL_PREFIX:PATH="/opt/freecad-qt5" \
	      -DOCC_INCLUDE_DIR:PATH=/opt/opencascade/inc \
	      -DOCC_LIBRARY_DIR:PATH=/opt/opencascade/lib \
	      -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	      -DPYSIDEUIC4BINARY:FILEPATH=/usr/bin/python2-pyside2-uic \
	      -DCMAKE_PREFIX_PATH=/opt/qt5.6 \
	      -DCMAKE_INSTALL_RPATH=/opt/qt5.6/lib \
	      -DPYTHON_EXTENSION_SUFFIX=-python2.7 \
	      -DPYTHON_BASENAME=-python2.7 \
	      -DBUILD_QT5=ON

	make
}

package() {
	cd "$srcdir/$pkgname"

	make DESTDIR="$pkgdir" install
	
	# Scripts that execute /opt/freecad-qt5/bin/<name>
	install -D -m755 "$srcdir/FreeCAD-Qt5" "$pkgdir/usr/bin/FreeCAD-Qt5"
	install -D -m755 "$srcdir/FreeCADCmd-Qt5" "$pkgdir/usr/bin/FreeCADCmd-Qt5"

	# Lowercase aliases like the official arch package.
	ln -s "/usr/bin/FreeCAD-Qt5" "$pkgdir/usr/bin/freecad-qt5"
	ln -s "/usr/bin/FreeCADCmd-Qt5" "$pkgdir/usr/bin/freecadcmd-qt5"

	# Install pixmaps and desktop shortcut.
	desktop-file-install --dir="$pkgdir/usr/share/applications" \
		"$srcdir/freecad-qt5.desktop"

	# Install mime info.
	install -D -m644 "$srcdir/freecad-qt5.xml" \
	  "$pkgdir/usr/share/mime/packages/freecad-qt5.xml"
}
