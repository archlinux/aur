# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jordi De Groof <jordi (dot) degroof (at) gmail (dot) com>
# Contributor: mickele
# Contributor: manwithgrenade
# Contributor: bricem13
# Contributor: gborzi

pkgname=freecad
pkgver=0.16.6712
pkgrel=4
pkgdesc='A general purpose 3D CAD modeler'
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('boost-libs' 'curl' 'opencascade>=6.6.0' 'python2-pivy' 'xerces-c'
         'libspnav' 'shared-mime-info' 'hicolor-icon-theme'
         'python2-matplotlib' 'python2-shiboken' 'python2-pyside-tools' 'pyside-tools-common' 'qt4')
makedepends=('boost' 'eigen' 'gcc-fortran' 'swig' 'xerces-c' 'desktop-file-utils' 'cmake' 'coin>=3.1.3-9')
# TODO add reasons
optdepends=('python2-matplotlib' 'python2-pyqt4'
"graphviz: Dependency graph feature")
source=("$pkgname-$pkgver.tar.gz::https://github.com/FreeCAD/FreeCAD/archive/$pkgver.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}.xml"
        "remove-qtwebkit.patch"
        "remove-webgui.patch")
md5sums=('40ea50aa495c0dfc2b247dc6a32aec2a'
         'b7bd72a67073c2869da263d8df61f205'
         'c2f4154c8e4678825411de8e7fa54c6b'
         '19e9cd7d41a1ddd557cef05a6b23bdee'
         '6b5f9253c559c7aacaa277b2973fbaf3')

prepare() {
  cd "${srcdir}/FreeCAD-${pkgver}/"

  # Remove QtWebkit dependency
  patch -Np1 -i ../remove-qtwebkit.patch

  # Remove features depending on Web module
  patch -Np1 -i ../remove-webgui.patch

  # http://www.freecadweb.org/tracker/view.php?id=2347
  sed -i 's/boost::re_detail/boost::BOOST_REGEX_DETAIL_NS/' \
    src/Mod/Drawing/App/FeaturePage.cpp
}

build() {
  cd "${srcdir}/FreeCAD-${pkgver}/"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH="/usr/lib/freecad" \
    -DCMAKE_INSTALL_DOCDIR:PATH="/usr/share/freecad/doc" \
    -DCMAKE_INSTALL_DATADIR:PATH="/usr/share/freecad" \
    -DOCC_INCLUDE_DIR:PATH=/opt/opencascade/inc/ \
    -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
    -DFREECAD_USE_EXTERNAL_PIVY:BOOL=ON \
    -DBUILD_START=OFF \
    -DBUILD_WEB=OFF
  make
}

package() {
  cd "${srcdir}/FreeCAD-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Symlink to /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/freecad"
  ln -srf "$pkgdir/usr/lib/freecad/bin/FreeCAD" "${pkgdir}/usr/bin/FreeCAD"
  ln -srf "$pkgdir/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/freecadcmd"
  ln -srf "$pkgdir/usr/lib/freecad/bin/FreeCADCmd" "${pkgdir}/usr/bin/FreeCADCmd"

  # Install pixmaps and desktop shortcut
  desktop-file-install \
    --dir="${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"
  for i in 16 32 48 64; do
	  install -Dm644 "src/Gui/Icons/freecad-icon-${i}.png" \
		  "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/freecad.png"
  done
  install -Dm644 "src/Gui/Icons/freecad.svg" \
	  "$pkgdir/usr/share/icons/hicolor/scalable/apps/freecad.svg"

  # Mime info
  install -D -m644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
