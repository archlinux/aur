# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=2.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/dftd4/dftd4"
depends=('gcc-fortran' 'openblas' 'lapack')
makedepends=('git' 'meson' 'ninja')
license=('LGPL3')
pkgdesc="A Generally Applicable Atomic-Charge Dependent London Dispersion Correction"
source=("${pkgname}::https://github.com/dftd4/dftd4/archive/v2.4.0.tar.gz"
        "dftd4-build.patch")
sha256sums=('6c3c8e07a4574ed5f54275944596a9845c38a9ed6c7217dc8769ebf95340bee9'
            '36ce3527ec42095836a84b5aa4050acab602b9fca5eb95ea20bf28c299d086f7')
md5sums=('97602f1a1239528f6e2487f31607c1e0'
         'f69b8bac09b6f4dd29b1aaca763913c7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch < "${srcdir}"/dftd4-build.patch
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
