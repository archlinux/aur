# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

pkgname=eigen-qfix
pkgver=3.3.8
pkgrel=2
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra (fix assertion bug in 3.3.8)"
arch=('any')
url='https://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
provides=("eigen=3.3.9")
conflicts=(eigen)
makedepends=('cmake' 'pkg-config' 'freeglut' 'gcc-fortran' 'fftw' 'suitesparse' 'boost')
source=(https://gitlab.com/libeigen/eigen/-/archive/$pkgver/${pkgname%-qfix}-$pkgver.tar.gz
	'assert.patch::https://gitlab.com/libeigen/eigen/-/merge_requests/232.diff')
sha256sums=('146a480b8ed1fb6ac7cd33fec9eb5e8f8f62c3683b3f850094d9d5c35a92419a'
            '62590e9b33a8f72b608a72b87147a306e7cb20766ea53c6b8e0a183fa6cb7635')

prepare() {
  patch -Np1 ${srcdir}/${pkgname%-qfix}-${pkgver}/Eigen/src/Core/products/Parallelizer.h ${srcdir}/assert.patch
}

build() {
  cmake -B build -S ${pkgname%-qfix}-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 ${pkgname%-qfix}-$pkgver/COPYING.* -t "$pkgdir/usr/share/licenses/${pkgname%-qfix}"
}
