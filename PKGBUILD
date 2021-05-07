# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=freecad-git
pkgver=0.19.r581.g20e756306d
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
vtk
#vtk9-java
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
'luxcorerender: ray tracing support'
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

  # add support for vtk version 9
  curl https://github.com/wwmayer/FreeCAD/commit/52599f771fa934ceeb11a970c3639bfa8f90411e.patch | patch -p1 --forward || true

  #git revert --no-commit 663ac994a794606e56d086cac85598517bd323dc
  #git checkout 927fdc9edc
}

build() {
  cd FreeCAD

  cmake -Wno-dev \
    -D BUILD_ENABLE_CXX_STD=C++14 \
    -D BUILD_QT5=ON \
    -D BUILD_FEM=ON \
    -D BUILD_MESH=ON \
    -D BUILD_MESH_PART=ON \
    -D BUILD_SHIP=ON \
    -D BUILD_ASSEMBLY=OFF \
    -D BUILD_PLOT=ON \
    -D CMAKE_INSTALL_PREFIX="" \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_C_FLAGS="${CFLAGS} -fPIC -w" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC -w" \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_OCC_VARIANT="Official Version" \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -G Ninja \
    -B build_dir \
    -S .

  cmake --build build_dir
}

check() {
  cd FreeCAD
  DESTDIR=check cmake --build build_dir -- install

  cd build_dir/check
  export LD_LIBRARY_PATH="$(pwd)/lib"
  export PYTHONPATH="$(pwd)/lib"
  bin/FreeCADCmd --console --run-test 0
}

package() {
  cd FreeCAD
  local _destdir=/usr  # maybe this belongs in /opt/freecad-git
  DESTDIR="${pkgdir}${_destdir}" cmake --build build_dir -- install

  # fix some bad install locations
  mkdir -p "${pkgdir}${_destdir}"/share/freecad
  mv "${pkgdir}${_destdir}"/share/{examples,Mod,Gui} "${pkgdir}${_destdir}"/share/freecad

  # fix Ext & Mod locations
  mkdir -p "${pkgdir}${_destdir}"/lib/freecad
  mv "${pkgdir}${_destdir}"/{Ext,Mod,bin} "${pkgdir}${_destdir}"/lib/freecad

  # links for bin
  mkdir -p "${pkgdir}${_destdir}"/bin
  FILES="${pkgdir}${_destdir}"/lib/freecad/bin/*
  for f in $FILES
  do
    ln -s ${_destdir}/lib/freecad/bin/$(basename $f) "${pkgdir}${_destdir}"/bin/$(basename $f)
  done

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${pkgdir}${_destdir}"/share/License.txt
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
