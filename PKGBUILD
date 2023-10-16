# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RNetCDF
_pkgver=2.7-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to 'NetCDF' Datasets"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
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
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-build.patch::https://github.com/mjwoods/RNetCDF/pull/128.patch")
md5sums=('4ea0d88f5bb0b80ac2befd5903367977'
         '6bb281a312b6b7220bf7ff83a01fdaa2')
sha256sums=('80626172829077807c6f14506782ffd85a316f0c09539c3d64d4594edc756d0b'
            '5b90ca93e960cf518c6af8dcb39a7375a6bf01a755560671f86ffe1277a824ad')

prepare() {
  # fix build
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-build.patch"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
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
