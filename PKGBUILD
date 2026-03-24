# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=Rserve
_pkgver=1.8-19
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
md5sums=('f9c86668ca138215541d7236f01a7357'
         '14db30e2b5f891214adf035312aeab2a')
b2sums=('8d2bb9f988198617572fbbfe3b2138638db90ba7235f17552a7fd207e7c739dbe785c57d7ee8358e8f53f502d3b5c350ba010ac1bdf3daed6be490f4cb786ba9'
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
