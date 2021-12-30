# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=pingr
_cranver=2.0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Check if a Remote Computer is Up"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(iputils r r-processx)
checkdepends=(r-testthat)
optdepends=(
    r-covr
    r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "ping-fix.patch::https://github.com/r-lib/pingr/commit/9baf94948afefa869a707d30330fb9d29e227d7e.patch"
        "R-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('d49653e705e99ed6ff950d305777ffc18da09b1a79a3091622eeef5df25f7221'
            'e0d5dd08d99fdefc0cb401383c9ec1516c9a2ceee1dd58a6f1a56fbde5480d3c'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

prepare() {
  # convert the patch to use CR-LF line endings as the source
  # code uses that for some reason (but not on github)
  sed $'s/$/\r/' ping-fix.patch > ping-fix-dos.patch

  cd "${_cranname}"
  # fix ping when using non-English locale
  patch -Np1 --binary -i "${srcdir}/ping-fix-dos.patch"
}

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true R --vanilla -q -f testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 R-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
