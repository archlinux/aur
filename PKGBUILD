# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=freecad-git
pkgver=0.19_pre.r4724.g6c6f5e7fbf
pkgrel=1
epoch=0
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('x86_64')
url='https://www.freecadweb.org/'
license=('LGPL')
depends=(
boost-libs
glew
jsoncpp
libspnav
med
netcdf
opencascade
openmpi
pyside2-tools
python-matplotlib
python-pivy
python-pyside2
qt5-svg
qt5-tools
qt5-webkit
qt5-x11extras
qt5-xmlpatterns
shared-mime-info
xerces-c
)
makedepends=(
boost
cmake
coin
eigen
gcc-fortran
gendesk
git
ninja
pyside2
python-shiboken2
shiboken2
swig
)
provides=('freecad')
conflicts=('freecad' 'freecad-appimage' 'freecad-appimage-git')
source=("git+https://github.com/FreeCAD/FreeCAD.git")
md5sums=('SKIP')

pkgver() {
  cd FreeCAD
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FreeCAD
  # patch out a build error
  #curl -L "https://github.com/FreeCAD/FreeCAD/pull/2842/commits/095984fce44931a4c8e2ace269d45a62640fbfb4.patch" | patch -p1

  mkdir -p build
  cd build
  cmake -Wno-dev .. \
    -D BUILD_ENABLE_CXX_STD=C++14 \
    -D BUILD_QT5=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS} -fPIC -w" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC -w" \
    -D CMAKE_INSTALL_DATADIR="/usr/share/freecad" \
    -D CMAKE_INSTALL_DOCDIR="/usr/share/freecad/doc" \
    -D CMAKE_INSTALL_PREFIX="/usr/lib/freecad" \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_OCC_VARIANT="Official Version" \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -G Ninja
}

build() {
  cd FreeCAD
  ninja -C build
}

check() {
  cd FreeCAD
  ./build/bin/FreeCAD --console --run-test 0
}

package() {
  cd FreeCAD
  DESTDIR="${pkgdir}" ninja -C build install

  # Create desktop shortcut
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name FreeCAD \
    --mimetypes='application/x-extension-fcstd' --startupnotify=true

  # Package desktop shortcut
  install -Dm644 freecad.desktop \
    "${pkgdir}/usr/share/applications/freecad.desktop"

  # Package MIME info
  #install -Dm644 freecad.xml "$pkgdir/usr/share/mime/packages/freecad.xml"

  cd src/Gui/Icons

  # Package icons
  for i in 16 32 48 64; do
    install -Dm644 "freecad-icon-$i.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x$i/apps/freecad.png"
  done
  install -Dm644 freecad.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/freecad.svg"

  # Package symlinks in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/lib/freecad/bin/FreeCAD "${pkgdir}/usr/bin/freecad"
  ln -sf /usr/lib/freecad/bin/FreeCAD "${pkgdir}/usr/bin/FreeCAD"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "${pkgdir}/usr/bin/freecadcmd"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "${pkgdir}/usr/bin/FreeCADCmd"
}
