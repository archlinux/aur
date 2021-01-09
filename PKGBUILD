# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=freecad-git
pkgver=0.19_pre.r4995.g1851ddd933
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
med
netcdf
opencascade
openmpi
pyside2-tools
python-yaml
python-matplotlib
python-pivy
python-ply
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
optdepends=(
'povray: ray tracing support'
'libspnav: 3d mouse support'
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
}

build() {
  cd FreeCAD

  cmake -Wno-dev .. \
    -D BUILD_ENABLE_CXX_STD=C++14 \
    -D BUILD_QT5=ON \
    -D CMAKE_INSTALL_PREFIX="" \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_FLAGS="${CFLAGS} -fPIC -w" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC -w" \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_OCC_VARIANT="Official Version" \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -G Ninja -B "${srcdir}/build" -S .

  ninja -C "${srcdir}/build"
}

check() {
  DESTDIR="${srcdir}/check" ninja -C "${srcdir}/build" install

  cd "${srcdir}/check"
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:lib bin/FreeCADCmd --console --run-test 0
}

package() {
  cd FreeCAD
  local _destdir=/usr/local/freecad  # maybe this belongs in /opt/freecad-git
  DESTDIR="${pkgdir}${_destdir}" ninja -C "${srcdir}/build" install

  mkdir -p "${pkgdir}"/usr/{share,bin,lib}

  # links for bin
  FILES="${pkgdir}${_destdir}"/bin/*
  for f in $FILES
  do
    ln -s ${_destdir}/bin/$(basename $f) "${pkgdir}"/usr/bin/$(basename $f)
  done

  # links for lib
  FILES="${pkgdir}${_destdir}"/lib/*
  for f in $FILES
  do
    ln -s ${_destdir}/lib/$(basename $f) "${pkgdir}"/usr/lib/$(basename $f)
  done

  # manage share files
  mv "${pkgdir}${_destdir}"/share/{applications,doc,icons,metainfo,mime,pixmaps,thumbnailers} "${pkgdir}"/usr/share

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${pkgdir}${_destdir}"/share/License.txt
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
