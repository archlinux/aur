# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=torch
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
  https://download.pytorch.org/libtorch/cpu/libtorch-shared-with-deps-2.8.0+cpu.zip
  https://torch-cdn.mlverse.org/binaries/refs/heads/cran/v${_pkgver}/latest/lantern-$_pkgver+cpu+x86_64-Linux.zip
)
md5sums=('962471bc62a5a8a35e4bcc14bc0e27e5'
         'cedcb2102f9734543df22a8e33523e2f'
         'f69b8b2f6a2229fb35e0f6c4903333dd')
b2sums=('0f19ee2587008374a5c64dfa3bdf109562e0057258b3e8a46f3b483b2faad8f4a51840480a91bcd9a39dd429a5886fcc656949ba9d76155e538d0192ca55cea4'
        'a2453310eb45ff42ca1fa5938429e1a2cdfe9a15821baa29e2b275f4fe9a2d2c78948886cfb130bfd3177e534520924f3e39d1bad57bcf90704eb75de2ece7b7'
        '600cce08b214ff811104276ea1fe989e88c9c274d84eaccdf0efa96514ee43ca2eb9b9153e7dbf25d1a2620028b10568a53be879c3bf34575fd5fbd19cd5cb5f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
  # We do it manually:
  cp -a $srcdir/libtorch/* $pkgdir/usr/lib/R/library/torch/
  cp -a $srcdir/lantern-$_pkgver+cpu+x86_64-Linux/* $pkgdir/usr/lib/R/library/torch/

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
