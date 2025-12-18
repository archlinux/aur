# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNetCDF
_pkgver=2.11-1
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
md5sums=('9acc95ef2f172363ce3f88ae7c5632c3')
b2sums=('558e7babf251dd322a42c866344998a713dcca380ac87ca0e10354f34f372c131197b55c22de48de43f9898e3636a9379dae4a9235bb082c1e7563c963aad9a9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-args="--with-mpicc=/usr/bin/mpicc --with-mpiexec=mpiexec"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla RNetCDF-test.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
