# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=Rserve
_pkgver=1.8-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Binary R server"
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
md5sums=('1ff84f0cc4c026ccec13686bd9f17846'
         '14db30e2b5f891214adf035312aeab2a')
b2sums=('b0a3ba4b88eb53533fe8fa942b2a9381ac73874c82c0eca3bc02d7cac75683502b1c2c5609f64069aeed607f448ac6d17ed50a9af3783f610b9d3ca43645d481'
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
