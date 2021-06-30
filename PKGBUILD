# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=freecad-git
pkgver=0.19.r909.gc401e3efe3
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
'openscad: OpenSCAD support'
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

  #sed 's,from femexamples.boxanalysis_frequency import setup,return,' -i src/Mod/Fem/femtest/app/test_ccxtools.py
  #sed 's,from femexamples.thermomech_flow1d import setup,return,' -i src/Mod/Fem/femtest/app/test_ccxtools.py

  #git revert --no-commit 663ac994a794606e56d086cac85598517bd323dc
  #git checkout 927fdc9edc
}

_destdir="/usr"

build() {
  cd FreeCAD

  cmake -Wno-dev -G Ninja -B build_dir -S . \
    -D BUILD_ENABLE_CXX_STD=C++14 \
    -D BUILD_QT5=ON \
    -D BUILD_FEM=ON \
    -D BUILD_MESH=ON \
    -D BUILD_MESH_PART=ON \
    -D BUILD_SHIP=ON \
    -D BUILD_ASSEMBLY=OFF \
    -D BUILD_COMPLETE=ON \
    -D BUILD_PLOT=ON \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_C_FLAGS="${CFLAGS} -fPIC -w" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC -w" \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_OCC_VARIANT="Official Version" \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -D INSTALL_TO_SITEPACKAGES=ON \
    -D CMAKE_INSTALL_PREFIX="${_destdir}/lib/freecad" \
    -D CMAKE_INSTALL_BINDIR=bin \
    -D CMAKE_INSTALL_LIBDIR='../../lib' \
    -D CMAKE_INSTALL_DATADIR='../../share/freecad' \
    -D CMAKE_INSTALL_DATAROOTDIR='../../share' \
    -D CMAKE_INSTALL_DOCDIR='../../share/doc/freecad'

  cmake --build build_dir
}

check() {
  cd FreeCAD
  unset PATH_TO_FREECAD_LIBDIR
  cd build_dir
  bin/FreeCADCmd --console --run-test 0
}

package() {
  cd FreeCAD
  DESTDIR="${pkgdir}" cmake --install build_dir

  # get python site package folder in the right place
  cp -a "${pkgdir}${_destdir}"/lib/freecad/lib "${pkgdir}${_destdir}"
  rm -rf "${pkgdir}${_destdir}"/lib/freecad/lib

  # link all the .sos into python site package dir
  python_site_packages="$(python -c 'import sys; print(sys.path[-1])')"
  mkdir -p "${pkgdir}/${python_site_packages}"
  FILES="${pkgdir}${_destdir}"/lib/*.so
  for f in $FILES
  do
    ln -s ${_destdir}/lib/$(basename $f) "${pkgdir}/${python_site_packages}/$(basename $f)"
  done

  # links for bin
  mkdir -p "${pkgdir}${_destdir}"/bin
  FILES="${pkgdir}${_destdir}"/lib/freecad/bin/*
  for f in $FILES
  do
    ln -s '../lib/freecad/bin/'$(basename $f) "${pkgdir}${_destdir}"/bin/$(basename $f)
  done

  # env var for __init__.py
  mkdir -p "${pkgdir}"/etc/profile.d
  echo "export PATH_TO_FREECAD_LIBDIR=${_destdir}/lib" > "${pkgdir}"/etc/profile.d/freecad.sh

  install -Dt "${pkgdir}${_destdir}/share/licenses/${pkgname}" -m644 LICENSE
}
