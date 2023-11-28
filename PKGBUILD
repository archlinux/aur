# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=Rserve
_pkgver=1.8-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('1ff84f0cc4c026ccec13686bd9f17846'
         '14db30e2b5f891214adf035312aeab2a')
sha256sums=('7e5d312fca8029d746f60e7d9e701129561942f97dfc33b036b123f159d69a4c'
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
