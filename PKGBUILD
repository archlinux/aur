# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Submitter: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=packmol
pkgver=15.217
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=("gcc-libs" "tcl" "bash")
makedepends=("gcc-fortran")
arch=("i686" "x86_64")
license=("GPL2")
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=("http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-${pkgver}.tar.gz")
sha1sums=('a1172254194fbaa5a279dd3c6d3e742492267324')

build() {
  cd "${srcdir}/${pkgname}"

  sed -i 's/maxatom     =    500000/maxatom     =   2000000/g' sizes.f90
  sed -i 's/maxtype     =        50/maxtype     =       150/g' sizes.f90

  ./configure
  make
  mv packmol packmol_serial
  make parallel
  mv packmol packmol_parallel
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D -m755 packmol_serial "${pkgdir}"/usr/bin/packmol_serial
  install -D -m755 packmol_parallel "${pkgdir}"/usr/bin/packmol_parallel
  install -D -m755 ppackmol "${pkgdir}"/usr/bin/ppackmol
  install -D -m755 solvate.tcl "${pkgdir}"/usr/bin/solvate.tcl
  cd "${pkgdir}"/usr/bin/
  ln -s /usr/bin/packmol_parallel ./packmol
}
