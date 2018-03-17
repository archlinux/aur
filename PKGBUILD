# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-scripting-git
pkgver=r9486.28f1209ce
pkgrel=2
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools, build from latest git with scripting enabled"
arch=('any')
url="http://kicad-pcb.org/"
license=('GPL')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python' 'glm' 'curl' 'swig' 'wxpython-gtk2' 'oce' 'ngspice>=27')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-footprints' 'kicad-symbols' 'kicad-packages3d')
conflicts=('kicad' 'kicad-bzr' 'kicad-git')
provides=('kicad')
install=kicad.install
source=("${pkgname}"'::git+git://git.launchpad.net/kicad')
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
	   .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DKICAD_USE_OCE=ON \
              -DOCE_DIR=`dirname $(pacman -Ql oce | grep OCEConfig.cmake | awk '{ print $2 }' )` \
              -DBUILD_GITHUB_PLUGIN=ON \
              -DKICAD_SCRIPTING=ON \
              -DKICAD_SCRIPTING_MODULES=ON \
              -DKICAD_SCRIPTING_WXPYTHON=ON \
              -DKICAD_SCRIPTING_ACTION_MENU=ON
  
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make DESTDIR="${pkgdir}" install
}
