# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=dtplyr
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Table Back-End for 'dplyr'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-data.table
  r-dplyr
  r-glue
  r-lifecycle
  r-rlang
  r-tibble
  r-tidyselect
  r-vctrs
)
checkdepends=(
  r-testthat
  r-tidyr
)
optdepends=(
  r-bench
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyr
  r-waldo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-tests-1.patch::https://github.com/tidyverse/dtplyr/commit/52f4c65fa898213dd4bd778e5854f4429e0dbcb1.patch"
        "fix-tests-2.patch")
md5sums=('ad62a3b9b0fdcdaf84da68131edc5155'
         '125cf7416ac8b057a81ef48ea12ff880'
         'fc764beecb5093ab33fbf56c7e9c8c12')
b2sums=('60fb5927ef5adf144abd257262a644630b45221ef2c727157bb6a8dccdaa98f90979feb421377c65ee0066c477c432b9da457e9c20266d07af8c757adfad2359'
        'ff13698456b9b29423f6fdc218df49b9ff5dc8357c9bde10a76b4db02d413e499431276bbbfbe496fd9e7d81f6a3ea3f1db76353b4223abba02b2cec1963cb51'
        '2941395d51fb661330144a23d22c4f27d2f3a82eb73061138dfe7f34a196a91eec8c68747429721442c34d9708cfa8dcf5e96d8c932c5e6cfa0bb12d82b4bc89')

#prepare() {
  # fix snapshot tests
#  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-tests-1.patch"
#  patch -Np1 -i fix-tests-2.patch
#}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
