# Maintainer: Markus Hovorka <m.hovorka@live.de>

pkgname=freecad-netgen-git
pkgver=r7819.ca0a640
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler'
arch=('i686' 'x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'hicolor-icon-theme' 'libspnav' 'oce' 'med'
         'python2-pivy' 'python2-pyside' 'python2-shiboken' 'qtwebkit'
         'shared-mime-info' 'python2-pyside-tools' 'netgen-nogui' 'vtk-qt4')
makedepends=('git' 'xerces-c' 'boost' 'cmake' 'coin' 'desktop-file-utils'
             'eigen' 'gcc-fortran' 'swig')
optdepends=('python2-matplotlib' 'pycollada-git' 'python2-pyqt4')
repo=freecad
source=("${repo}::git+https://github.com/FreeCAD/FreeCAD.git"
        "freecad.desktop"
        "freecad.xml"
        "netgen_v5.patch")
md5sums=('SKIP'
         '382cd66757dae635b53105d207679fce'
         'c2f4154c8e4678825411de8e7fa54c6b'
         'dcbdccc12a1839776ac63d8d4463995e')

pkgver()
{
	cd "${repo}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	cd "${srcdir}/${repo}"
	patch -Np1 <../netgen_v5.patch
}

build()
{
	cd "${srcdir}/${repo}"

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
	      -DOCC_INCLUDE_DIR:PATH=/opt/oce/include/oce \
	      -DOCC_LIBRARY_DIR=/opt/oce/lib \
	      -DVTK_DIR:PATH=/opt/vtk-qt4/lib/cmake/vtk-7.0 \
	      -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	      -DPYSIDEUIC4BINARY:FILEPATH=/usr/bin/python2-pyside-uic \
	      -DBUILD_FEM_NETGEN=1

	make
}

package()
{
	cd "${srcdir}/${repo}"

	make DESTDIR="${pkgdir}" install

	# Install pixmaps and desktop shortcut
	desktop-file-install \
	  --dir="${pkgdir}/usr/share/applications" "${srcdir}/freecad.desktop"

	# Mime info
	install -D -m644 "${srcdir}/freecad.xml" \
	  "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
