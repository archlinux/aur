# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Adrian Insaurralde <adrianinsaval at gmail dot com>

pkgname=freecad-git
pkgver=1.1.0.41361.g774ec2cc93
pkgrel=1
pkgdesc='A general purpose 3D CAD modeler - git checkout'
arch=('x86_64')
url='https://www.freecad.org/'
license=('LGPL')
depends=(
boost-libs
coin
fmt
glew
jsoncpp
med
netcdf
opencascade
openmpi
pybind11
pyside6
pyside6-tools
python-yaml
python-matplotlib
python-packaging
python-pivy
python-ply
qt6-svg
qt6-tools
qt6-base
qt6-5compat
shared-mime-info
vtk
verdict
xerces-c
yaml-cpp
)
makedepends=(
boost
cmake
eigen
git
ninja
nlohmann-json
shiboken6
swig
)
checkdepends=(
pugixml
)
optdepends=(
'libspnav: 3D mouse support'
'openscad: OpenSCAD support'
'graphviz: dependency graph support'
'python-pip: support installing python dependencies for addons'
'calculix-ccx: FEM solver backend'
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
  git submodule update --init
}

build() {
  cmake \
    -B build-makepkg \
    -D BUILD_FLAT_MESH=ON \
    -D BUILD_DESIGNER_PLUGIN=ON \
    -D FREECAD_QT_VERSION=6 \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects -fPIC -w" \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects -fPIC -w" \
    -D CMAKE_INSTALL_DATADIR=/usr/share/freecad \
    -D CMAKE_INSTALL_DATAROOTDIR=/usr/share \
    -D CMAKE_INSTALL_DOCDIR=/usr/share/freecad/doc \
    -D CMAKE_INSTALL_PREFIX=/usr/lib/freecad \
    -D FREECAD_USE_PCL=OFF \
    -D FREECAD_USE_EXTERNAL_PIVY=ON \
    -D FREECAD_USE_QT_FILEDIALOG=ON \
    -D INSTALL_TO_SITEPACKAGES=ON \
    -D ENABLE_DEVELOPER_TESTS=OFF \
    -G Ninja \
    -S FreeCAD \
    -W no-dev
  ninja -C build-makepkg
}

check() {
  cd build-makepkg
  LD_LIBRARY_PATH=lib bin/FreeCADCmd --console --run-test 0
}

package() {
  DESTDIR="$pkgdir" ninja -C build-makepkg install

  # tools
  install -Dm755 FreeCAD/src/Tools/fcinfo -t "$pkgdir/usr/bin/"

  # symlinks
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/freecad/bin/freecad-thumbnailer "$pkgdir/usr/bin/freecad-thumbnailer"
  ln -sf /usr/lib/freecad/bin/FreeCAD "$pkgdir/usr/bin/freecad"
  ln -sf /usr/lib/freecad/bin/FreeCAD "$pkgdir/usr/bin/FreeCAD"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "$pkgdir/usr/bin/freecadcmd"
  ln -sf /usr/lib/freecad/bin/FreeCADCmd "$pkgdir/usr/bin/FreeCADCmd"
}
