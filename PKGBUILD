# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=Rserve
_pkgver=1.8-19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Versatile R Server"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only WITH openvpn-openssl-exception')
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
md5sums=('671f555bfac0ae1ba713b526b6a4cf1a'
         '14db30e2b5f891214adf035312aeab2a')
b2sums=('c62a1092afaa83b44746fbaa74162c2c6a06e8acb564f12393e66c51e249460a3c8eecc58d1fb6b960386dee0ed4e97ab4d2fa4244ecfcd538be9673a9ab16d7'
        'a480df5dd2ab3dbf7c72c248add04e5f986eed3f5e5ebdca3acaa3819345098e1e9a305cd5927896ee0999fc71fea5e2d0a08bb309da72123ed35761b2dae29b')

prepare() {
  # prevent installing executables during build
  patch -Np1 -i fix-install.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-args="--enable-ipv6 --enable-threads"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  # symlink executables to R_HOME
  install -d "$pkgdir/usr/lib/R/bin"
  ln -s "../library/$_pkgname/libs/Rserve"{,.dbg} "$pkgdir/usr/lib/R/bin"
}
