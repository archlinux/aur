# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=kicad-bzr
pkgver=r4835
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=('i686' 'x86_64')
url="http://iut-tice.ujf-grenoble.fr/kicad/"
license=('GPL')
depends=('glew' 'wxgtk' 'hicolor-icon-theme' 'desktop-file-utils' 'boost-libs')
makedepends=('cmake' 'bzr' 'zlib' 'mesa' 'boost')
optdepends=('kicad-docs-bzr: for documentation' 
            'kicad-library-bzr: for footprints'
            'git: github pcb plugin')
conflicts=('kicad')
provides=('kicad')
install=kicad.install
source=('bzr+lp:kicad')
md5sums=('SKIP')
_bzrmod=kicad

# mkdir -p "$pkgdir/etc/profile.d"
# echo "export KIGITHUB=https://github.com/KiCad" > "$pkgdir/etc/profile.d/kicad.sh"
# https://github.com/blairbonnett-mirrors/kicad/blob/master/scripts/kicad-install.sh

pkgver() {
  cd "$srcdir/$_bzrmod"
  echo "r$(bzr revno)"
}

build() {
  cd "$srcdir/$_bzrmod"
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
  cd "$srcdir/$_bzrmod/build/Release"
  make DESTDIR="$pkgdir" install
}
