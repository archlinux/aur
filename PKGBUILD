# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=torch
_pkgver=0.15.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tensors and Neural Networks with 'GPU' Acceleration"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-bit64
  r-callr
  r-cli
  r-coro
  r-desc
  r-glue
  r-jsonlite
  r-magrittr
  r-r6
  r-rcpp
  r-rlang
  r-safetensors
  r-scales
  r-withr
)
optdepends=(
  r-covr
  r-katex
  r-knitr
  r-mvtnorm
  r-numderiv
  r-palmerpenguins
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('e056e6043acc4faa0acba3dcd42dafa9'
         '539874681ec47604d54ac506a0f7a14d')
b2sums=('750b0a179acb61a10e5adf3c86dc3943812e0ed38ea7dfbf6a7ccfbd815ad34079f06fa87d5690364fbec82b9ba700ccc4224461da4d1bc25aab8b9ea7177df2'
        '81629ea7a33491bf8dcec19019d97b90d838559adb023cde8e1bca1165bba58c9d48fb931300f51a717c0b048fd13750b3fdec16c416ed43e1de9296d146ee6e')

prepare() {
  # remove unnecessary torch.so library copy
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
