# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BioNAR
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biological Network Analysis in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-clustercons
  r-cowplot
  r-data.table
  r-dplyr
  r-fgsea
  r-ggplot2
  r-ggrepel
  r-go.db
  r-igraph
  r-latex2exp
  r-minpack.lm
  r-org.hs.eg.db
  r-powerlaw
  r-rdpack
  r-rspectra
  r-rspectral
  r-scales
  r-stringr
  r-viridis
  r-wgcna
)
checkdepends=(
  r-igraphdata
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-igraphdata
  r-knitr
  r-magick
  r-pander
  r-plotly
  r-randomcolor
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('60ea801489d5db3a2bb2e00d1acc1056'
         '4a0d1366b4a7d786d07d1553c9a7899e')
b2sums=('9a2a1a98ccff8e9d8054295f5b53321dcd03f9d996a1931f4e6a51c98af378ac2d0e0ef9a1ff51e43b15ff795ac523305037197d6b0e63ddd2f4aeeb28f6ff34'
        '5bcc25f82c45ce8442351f73a851f34bf2c76b286dd708141882f928876d02fba213e8760146cd3115d298985aa062fb67d9a5d89ea7a62687d65fdfb3349a84')

prepare() {
  # fix test snapshots
  patch -Np1 -i fix-tests.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
