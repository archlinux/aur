# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=Rserve
_pkgver=1.8-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Binary R server"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  libxcrypt
  openssl
  r
)
optdepends=(
  "java-runtime: REngine Java client"
  r-rsclient
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-install.patch")
md5sums=('53182272a555f31bf37132d7b5d724f3'
         '14db30e2b5f891214adf035312aeab2a')
sha256sums=('9dfb1d68493f8cee5d2e12a1bfa604404834e11809f4c908d65b9100a9af1b85'
            '4dcfb5a31d71ce301c3556c434bed551753db077a95e3bd51918c2d40c34259f')

prepare() {
  # prevent installing executables during build
  patch -Np1 -i fix-install.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
      --configure-args="--enable-ipv6 --enable-threads"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  # symlink executables to R_HOME
  install -d "$pkgdir/usr/lib/R/bin"
  ln -s "../library/$_pkgname/libs/Rserve"{,.dbg} "$pkgdir/usr/lib/R/bin"
}
