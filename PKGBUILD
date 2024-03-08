# Maintainer: banana-bred <j.forer@posteo.net>
pkgname="molden"
pkgver=7.3
pkgrel=3
pkgdesc="A program for molecular and electronic structure visualization"
arch=('i686' 'x86_64')
url="https://www.theochem.ru.nl/molden/"
license=('custom')
groups=()
depends=('mesa' 'glu')
makedepends=(
    'vi'
    'gcc-fortran'
    'xorgproto'
    'libx11'
    'makedepend'
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
sha256sums=('870f4fa6635229791bb09bbbd07f51456b2c90101d73564dc47ed7769b8c07a1')

build() {
  cd "molden${pkgver}"

  # Patch to compile with gfortran 10+
  # Original contribution by Panadestein on 5/31/2020
  sed -i 's/FFLAGS += -g ${AFLAG}/& -fallow-argument-mismatch/g' makefile
  sed -i 's/FFLAGS = -g ${AFLAG}/& -fallow-argument-mismatch/g' docker/makefile
  make -k
}

package() {
  cd "molden$pkgver"
  install -t "$pkgdir/usr/bin/"  -Dm755 bin/{molden,gmolden,ambfor,ambmd,surf}
  install -t "$pkgdir/usr/share/doc/$pkgname" -Dm755 doc/figures.ps.Z  doc/manual.ps.Z doc/manual.txt.Z
  install -t "$pkgdir/usr/share/licenses/$pkgname/" -Dm755 CopyRight MOLDEN_COMMERCIAL_LICENSE REGISTER
}

# vim: ts=2 sw=2 et :
