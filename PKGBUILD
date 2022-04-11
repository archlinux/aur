# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=freecad-git
pkgver=0.20.0.28679.g35913fc695
pkgrel=1
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
pyside2
pyside2-tools
python-yaml
python-matplotlib
python-pivy
python-ply
qt5-svg
qt5-tools
qt5-webkit
qt5-webengine
qt5-x11extras
qt5-xmlpatterns
qt5-base
shared-mime-info
xerces-c
vtk
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
python-shiboken2
shiboken2
swig
)
checkdepends=(
fmt 
pugixml
)
optdepends=(
'povray: ray tracing support'
'luxcorerender: ray tracing support'
'libspnav: 3d mouse support'
'openscad: OpenSCAD support'
'graphviz: dependency graph support'
'python-markdown: markdown support in addon manager'
'python-gitpython: support downloading addons with git'
)
provides=('freecad')
conflicts=('freecad' 'freecad-appimage' 'freecad-appimage-git')
source=("git+https://github.com/FreeCAD/FreeCAD.git")
md5sums=('SKIP')

pkgver() {
  cd FreeCAD
  read -d$'/n' -r major minor patch < <(grep -Po "set\(PACKAGE_VERSION_(MAJOR|MINOR|PATCH) \"\K[0-9]*" CMakeLists.txt) || true
  count=$((24266 + $(git rev-list --count d29fd7d..HEAD) ))
  hash=$(git rev-parse --short HEAD)
  printf "%d.%d.%d.%d.g%s" "$major" "$minor" "$patch" "$count" "$hash"
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
    -D BUILD_ENABLE_CXX_STD=C++17 \
    -D BUILD_FEM=ON \
    -D BUILD_FEM_NETGEN=OFF \
    -D BUILD_MESH=ON \
    -D BUILD_FLAT_MESH=ON \
    -D BUILD_MESH_PART=ON \
    -D BUILD_SHIP=ON \
    -D BUILD_ASSEMBLY=OFF \
    -D BUILD_COMPLETE=ON \
    -D BUILD_JTREADER=OFF \
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
  LD_LIBRARY_PATH=lib bin/FreeCADCmd --console --run-test 0
}

package() {
  cd FreeCAD
  DESTDIR="${pkgdir}" cmake --install build_dir

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
