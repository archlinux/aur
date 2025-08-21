# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=torch
_pkgver=0.16.0
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
md5sums=('552e35de8a96da48d705a819b6f92a96'
         '539874681ec47604d54ac506a0f7a14d')
b2sums=('f222349ba2d95e223c0756abc9dc7e7d1099d7d219d296d7fd1aa466849b8a36664b9760f8435bc3e6a026bac39abf07a9b499bcccac6e8cc47c172dc8536835'
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
