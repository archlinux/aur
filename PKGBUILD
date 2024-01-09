# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNetCDF
_pkgver=2.9-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to 'NetCDF' Datasets"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
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
md5sums=('ad7be84de579f8527241b4f08bd36117')
b2sums=('196d30a11478056f3ccd13fa7ea74e7714bc9a08974416877614e8ec8441db1171e3f56961367daf034d9ab5aa679b4ee8dbd38a7fd06c6745a9a688c64cac81')

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
