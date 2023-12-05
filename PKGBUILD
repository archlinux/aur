# Maintainer: Dan Maftei <dan.maftei@gmail.com>
pkgname="molden"
pkgver=6.9
pkgrel=1
pkgdesc="A program for molecular and electronic structure visualization"
arch=('i686' 'x86_64')
url="http://www.cmbi.ru.nl/molden/"
license=('custom')
groups=()
depends=('mesa' 'glu')
makedepends=(
    'vi'
    'gcc-fortran'
    'xorgproto'
    'libx11'
    'mesa'
    'glu'
)
optdepends=(
   'openbabel: to create 2D images of the molecules in a .sdf file'
   'wget: to fetch PDB from rcsb.org'
)
provides=('molden')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://ftp.science.ru.nl/Molden/${pkgname}${pkgver}.tar.gz"
)
noextract=()
md5sums=('3551167d2853e5a6b3379edf74e81f1f')

build() {
  cd "molden${pkgver}"
  # Patch Makefile for surf utility to reflect
  # the replacement of missing makedepend
  sed -i 's/@.*makedepend.*$/@ \$(CC) \$(INCLUDE) -M \$(SRCS) \> makedep/' src/surf/Makefile

  # Patch to compile with gfortran 10
  # Contributed by Panadestein on 5/31/2020
  sed -i 's/FFLAGS = -g ${AFLAG}/& -fallow-argument-mismatch/g' makefile
  sed -i 's/FFLAGS = -c -g -ffast-math -funroll-loops -O3/& -fallow-argument-mismatch/g' src/ambfor/makefile
  make
}

package() {
  cd "molden$pkgver"
  install -t "$pkgdir/usr/bin/"  -Dm755 bin/{molden,gmolden,ambfor,ambmd,surf}
  install -t "$pkgdir/usr/share/doc/$pkgname" -Dm755 doc/figures.ps.Z  doc/manual.ps.Z doc/manual.txt.Z
  install -t "$pkgdir/usr/share/licenses/$pkgname/" -Dm755 CopyRight MOLDEN_COMMERCIAL_LICENSE REGISTER
}
