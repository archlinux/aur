# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
# Contriubuor: Kyle Keen <keenerd@gmail.com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-git
pkgver=r7432.50cdd5cdf
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=('i686' 'x86_64')
url="http://kicad-pcb.org/"
license=('GPL')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python' 'glm' 'curl' 'swig' 'wxpython')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-library: for footprints')
conflicts=('kicad' 'kicad-bzr')
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
  mkdir -p build/Release
  cd build/Release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DBUILD_GITHUB_PLUGIN=ON \
              -DKICAD_SCRIPTING=ON \
              -DKICAD_SCRIPTING_MODULES=ON \
              -DKICAD_SCRIPTING_WXPYTHON=ON
  make #-j1
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build/Release
  make DESTDIR="${pkgdir}" install
}
