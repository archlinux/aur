# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-symbols
_pkgver="5.0.0-rc1"
pkgver=${_pkgver//-}
pkgrel=2
pkgdesc="Official KiCad schematic symbol libraries -- stable release"
arch=('any')
url="https://kicad.github.io/symbols"
license=('GPL')
makedepends=('cmake')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library' 'kicad-symbols-git' 'kicad-pretty-git')
provides=($pkgname)
source=("https://github.com/KiCad/kicad-symbols/archive/${_pkgver}.tar.gz")
md5sums=('6287e48816ae4c4ae778c9fbceb7181d')

prepare() {
  cd "${pkgname}-${_pkgver}"
  # fixes for can't have slashes in symbol names https://github.com/KiCad/kicad-symbols/issues/390
  _SHA=b72d6d68fa28868ba52e1b1a5b5883474ed370a8
  curl https://github.com/KiCad/kicad-symbols/commit/${_SHA}.patch > ../slash.patch
  patch -Np1 -i ../slash.patch
  
  sed -i 's,LM334Z/LFT1,LM334Z-LFT1,' Reference_Current.dcm
  sed -i 's,LM334Z/LFT1,LM334Z-LFT1,' Reference_Current.lib
}

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${pkgname}-${_pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
