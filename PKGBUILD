# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=freecad-git
pkgver=0.18.r6973.gc4d42a1f74
pkgrel=2
epoch=0
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('x86_64')
url='https://www.freecadweb.org/'
license=('LGPL')
depends=(boost-libs glew jsoncpp libspnav med netcdf opencascade openmpi
         pyside2-tools python-matplotlib python-pivy python-pyside2 qt5-svg
         qt5-tools qt5-webkit qt5-x11extras shared-mime-info xerces-c)
makedepends=(boost cmake coin eigen gcc-fortran gendesk git ninja pyside2
             python-shiboken2 shiboken2 swig)
provides=('freecad')
conflicts=('freecad' 'freecad-appimage' 'freecad-appimage-git')
source=("git+https://github.com/FreeCAD/FreeCAD.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/FreeCAD"
    # upstream recyles the "pre" and "staging" tags so they do not produce stable commit counts
    git describe --long --tags --exclude '*pre*' --exclude '*staging*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_//'
}

prepare() {
  cd "${srcdir}/FreeCAD"
  # fix a build error
  #curl -L "https://github.com/FreeCAD/FreeCAD/pull/2842/commits/095984fce44931a4c8e2ace269d45a62640fbfb4.patch" | patch -p1
}

build() {
  # OpenCascade requires that /bin comes before /usr/bin in $PATH
  export PATH="/usr/bin:$PATH"

  mkdir -p build
  cd build
  cmake -Wno-dev ../FreeCAD \
    -D BUILD_QT5=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -fPIC -w" \
    -D CMAKE_INSTALL_DATADIR="/usr/share/freecad" \
    -D CMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
    -D CMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_OCC_VARIANT="Official Version" \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Create desktop shortcut
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name FreeCAD \
    --mimetypes='application/x-extension-fcstd' --startupnotify=true

  # Package desktop shortcut
  install -Dm644 freecad.desktop \
    "$pkgdir/usr/share/applications/freecad.desktop"

  # Package MIME info
  #install -Dm644 freecad.xml "$pkgdir/usr/share/mime/packages/freecad.xml"

  cd FreeCAD/src/Gui/Icons

  # Package icons
  for i in 16 32 48 64; do
    install -Dm644 "freecad-icon-$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/freecad.png"
  done
  install -Dm644 freecad.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/freecad.svg"


  # Package symlinks in /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/freecad/bin/FreeCAD "$pkgdir/usr/bin/freecad"
  ln -sf /usr/lib/freecad/bin/FreeCAD "$pkgdir/usr/bin/FreeCAD"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "$pkgdir/usr/bin/freecadcmd"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "$pkgdir/usr/bin/FreeCADCmd"
}
