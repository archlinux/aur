# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
# Contriubuor: Kyle Keen <keenerd@gmail.com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-git
pkgver=r7993.74f00d4
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools - git clone of bzr repo (faster download)"
arch=('i686' 'x86_64')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
depends=('glew' 'wxgtk' 'desktop-file-utils' 'boost-libs' 'python')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-docs-bzr: for documentation'
            'kicad-library-bzr: for footprints')
conflicts=('kicad' 'kicad-bzr')
provides=('kicad')
install=kicad.install
source=("${pkgname}"'::git+https://github.com/KiCad/kicad-source-mirror')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build/Release
  cd build/Release
  # -DKICAD_SKIP_BOOST=ON ?
  # -DKICAD_SCRIPTING=ON -DKICAD_SCRIPTING_MODULES=ON ?
  # -DKICAD_SCRIPTING_WXPYTHON=ON ?
  cmake ../.. -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DKICAD_SKIP_BOOST=ON \
              -DBUILD_GITHUB_PLUGIN=ON
  make #-j1
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build/Release
  make DESTDIR="${pkgdir}" install
}
