# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqminer
_pkgver=9.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Efficiently Read Sequence Data (VCF Format, BCF Format, METAL Format and BGEN Format) into R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  bzip2
  r
  sqlite
  zlib
  zstd
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-skat
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-buffer-overflows.patch::https://github.com/zhanxw/seqminer/pull/29.patch")
md5sums=('c1a395cd5a427013fc7b784d35ec37ac'
         'e156bd312594f28f4f9b90d050e06d05')
sha256sums=('79e2e74cdc20cf00d7c78354c5de5511140c6265af0f32cb4dac11dfb5cab76d'
            '6f4d3fd8acf0d370ca3100ff85f1ae8eb409cfc15a88585e4b5d8c92e1e69527')

prepare() {
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-buffer-overflows.patch"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
