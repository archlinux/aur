# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNetCDF
_pkgver=2.9-2
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
md5sums=('5c24b20a1ee55f5448ab06dd6a74a0d3')
b2sums=('f2c7da14f4faad39d59b806528f4d01217dbbf8a63e450689370106882ad8c1004c39f23e57d47f587ef276f9b90d70000ab11abbf8af5304780c3c06e2cd0d6')

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
