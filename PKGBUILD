# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=2.5.0
pkgrel=2
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
depends=('gcc-fortran' 'openblas' 'lapack')
makedepends=('meson' 'ninja')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}::https://github.com/dftd4/dftd4/archive/v2.5.0.tar.gz"
        "dftd4-build.patch")
sha256sums=('014e2917f2b636c062325d59a4a0f068550bd3b119742be80e956456478ee2d6'
            '06939d2b0370b7903bcbd3c4e824a7e78c4bbc71315846e9827cd0d49d020122')
md5sums=('f2685bcbea28bc811cf198091a0545dc'
         '4b0b95dc360c6ff73c46af6925ab4e76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}"/dftd4-build.patch
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"/_build
  cd "${srcdir}/${pkgname}-${pkgver}"/_build
  meson setup . .. \
      --buildtype release \
      --warnlevel 0 \
      --prefix=/usr \
      -Dla_backend=openblas
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/_build
  DESTDIR="$pkgdir" ninja install
}
