# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNetCDF
_pkgver=2.10-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to 'NetCDF' Datasets"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  netcdf-openmpi
  openmpi
  r
  udunits
)
checkdepends=(
  r-bit64
  r-pbdmpi
  r-rmpi
)
optdepends=(
  r-bit64
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8097178ed39326b6398e6b27c9b44759')
b2sums=('6dc657c97e9ecab53c6b09b0addfe06ff4429ac41afe8365c3dfa2c8c43c60aa001f43be11ab921e00ef88d05d9e308d35232d20e904337ee7097df8a21a07a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-args="--with-mpicc=/usr/bin/mpicc --with-mpiexec=mpiexec"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla RNetCDF-test.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
