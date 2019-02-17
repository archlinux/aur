# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-rc
_pkgver="5.1.0-rc1"
pkgver=${_pkgver/-rc/.}
pkgrel=2
pkgdesc="Official KiCad release candidates and dev snapshots"
arch=('any')
url="http://kicad-pcb.org/"
license=('GPL3')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python' 'glm' 'curl' 'swig' 'python-wxpython' 'opencascade' 'ngspice>=27' 'kicad-footprints' 'kicad-symbols' 'kicad-packages3d')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-symbols' 'kicad-packages3d' 'kicad-footprints' 'kicad-templates')
conflicts=('kicad' 'kicad-git' 'kicad-scripting-git' 'kicad-bzr')
provides=('kicad')
makedepends=('clang')
_github_project='kicad-source-mirror'
source=("https://github.com/KiCad/${_github_project}/archive/${_pkgver}.tar.gz")
md5sums=('8ad977a2cde8d60c793ef4cb04086dc7')
install=kicad.install


#prepare() {
  #sed -i -e 's|boost/uuid/sha1.hpp|boost/uuid/detail/sha1.hpp|g' kicad-source-mirror-5.0.0/3d-viewer/3d_cache/3d_cache.cpp
#}

build() {
  cd "${srcdir}/${_github_project}-${_pkgver}"
  mkdir -p build
  cd build
    CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKICAD_USE_OCE=OFF \
    -DKICAD_USE_OCC=ON \
    -DBUILD_GITHUB_PLUGIN=ON \
    -DKICAD_SCRIPTING=ON \
    -DKICAD_SCRIPTING_MODULES=ON \
    -DKICAD_SCRIPTING_WXPYTHON=ON \
    -DKICAD_SCRIPTING_WXPYTHON_PHOENIX=ON \
    -DKICAD_SCRIPTING_PYTHON3=ON \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
    -DKICAD_SCRIPTING_ACTION_MENU=ON

  CXX=clang++ make
}

package() {
  cd "${srcdir}/${_github_project}-${_pkgver}"
  cd build
  CXX=clang++ make DESTDIR="${pkgdir}" install
}
