# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-step-git
pkgver=r8181.d6a56e5d3
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools -- with STEP export"
arch=('i686' 'x86_64')
url="http://kicad-pcb.org/"
license=('GPL')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python' 'glm' 'curl' 'swig' 'wxpython' 'oce' 'ngspice')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-library: for footprints')
conflicts=('kicad' 'kicad-bzr' 'kicad-git')
provides=('kicad')
install=kicad.install
source=('git+git://github.com/KiCad/kicad-source-mirror')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/kicad-source-mirror"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/kicad-source-mirror"
  mkdir -p build/Release
  cd build/Release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
              -DBUILD_GITHUB_PLUGIN=ON \
              -DKICAD_SCRIPTING=ON \
	      -DKICAD_SPICE=TRUE \
	      -DKICAD_USE_OCE=TRUE \
	      -DOCE_DIR="/opt/oce/lib/oce-0.18" \
              -DKICAD_SCRIPTING_MODULES=ON \
              -DKICAD_SCRIPTING_WXPYTHON=ON \
              -DCMAKE_SKIP_RPATH=TRUE \
              -DCMAKE_SKIP_INSTALL_RPATH=TRUE
  make #-j1
}

package() {
  cd "${srcdir}/kicad-source-mirror"
  cd build/Release
  make DESTDIR="${pkgdir}" install
}
