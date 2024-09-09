# Maintainer: banana-bred <j.forer@posteo.net>
pkgname="molden"
pkgver=7.3
pkgrel=5
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
    'libxmu'
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

prepare() {
  cd "molden${pkgver}"

  # Patch to compile with gfortran 10+
  # Original contribution by Panadestein on 5/31/2020
  sed -i 's/FFLAGS += -g ${AFLAG}/& -fallow-argument-mismatch/g' makefile
  sed -i 's/FFLAGS = -g ${AFLAG}/& -fallow-argument-mismatch/g' docker/makefile

  # -- use mkstemp instead of mktemp
  sed -i 's/mktemp/mkstemp/g' src/xwin.c

  # -- ensure Wno-implicit-function-declaration is used to suppress this warning that becomes an error
  sed -i "106s/^/# /; 109s/^/# /" makefile
  sed -i "68s/^/# /; 71s/^/# /" docker/makefile

  # -- get the path to the current gcc version to add as an include directory for 'surf'
  _gccInclude="$(echo "$(dirname "$(gcc -print-prog-name=cc1)")/include" | sed 's/\//\\\//g')"

  # -- update include directories for surf
  sed -i "s/\(^INCLUDE\s*=\).*/\1 -I .\/ -I ${_gccInclude}/" src/surf/Makefile

}

build() {
  cd "molden${pkgver}"
  make -k
}

package() {
  cd "molden${pkgver}"
  install -t "$pkgdir/usr/bin/"  -Dm755 bin/{molden,gmolden,ambfor,ambmd,surf}
  install -t "$pkgdir/usr/share/doc/$pkgname" -Dm755 doc/figures.ps.Z  doc/manual.ps.Z doc/manual.txt.Z
  install -t "$pkgdir/usr/share/licenses/$pkgname/" -Dm755 CopyRight MOLDEN_COMMERCIAL_LICENSE REGISTER
}

# vim: ts=2 sw=2 et :
