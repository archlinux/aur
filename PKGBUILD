# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=kicad-git
pkgver=r10854.8e7d6063f
pkgrel=2
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=('i686' 'x86_64')
url="http://kicad-pcb.org/"
license=('GPL')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python'
         'glm' 'curl' 'swig' 'wxpython' 'opencascade' 'ngspice>=27')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-library: for footprints')
conflicts=('kicad' 'kicad-bzr')
provides=('kicad')
install=kicad.install
source=("${pkgname}"'::git+https://git.launchpad.net/kicad')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
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
  cd "${srcdir}/${pkgname}"
  cd build
  make DESTDIR="${pkgdir}" install
}
