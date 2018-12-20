# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-rc
_pkgver="5.0.2"
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Official KiCad release candidates and dev snapshots"
arch=('any')
url="http://kicad-pcb.org/"
license=('GPL3')
# glm 0.9.9.3 breaks the build
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python' 'glm<=0.9.9.2' 'curl' 'swig' 'wxpython' 'opencascade' 'ngspice>=27' 'kicad-footprints' 'kicad-symbols' 'kicad-packages3d')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-symbols' 'kicad-packages3d' 'kicad-footprints' 'kicad-templates')
conflicts=('kicad' 'kicad-git' 'kicad-scripting-git' 'kicad-bzr')
provides=('kicad')
_github_project='kicad-source-mirror'
source=("https://github.com/KiCad/${_github_project}/archive/${_pkgver}.tar.gz")
md5sums=('ed5e5835fa485a3b76d2b410dbb71db8')
install=kicad.install

#prepare() {
  #sed -i -e 's|boost/uuid/sha1.hpp|boost/uuid/detail/sha1.hpp|g' kicad-source-mirror-5.0.0/3d-viewer/3d_cache/3d_cache.cpp
#}

build() {
  cd "${srcdir}/${_github_project}-${_pkgver}"
  mkdir -p build
  cd build
    cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKICAD_USE_OCE=OFF \
    -DKICAD_USE_OCC=ON \
    -DOCE_DIR=`dirname $(pacman -Ql oce | grep OCEConfig.cmake | awk '{ print $2 }' )` \
    -DBUILD_GITHUB_PLUGIN=ON \
    -DKICAD_SCRIPTING=ON \
    -DKICAD_SCRIPTING_MODULES=ON \
    -DKICAD_SCRIPTING_WXPYTHON=OFF \
    -DKICAD_SCRIPTING_ACTION_MENU=ON

  make
}

package() {
  cd "${srcdir}/${_github_project}-${_pkgver}"
  cd build
  make DESTDIR="${pkgdir}" install
}
