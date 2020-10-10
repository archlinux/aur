# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

pkgname=eigen-qfix
pkgver=3.3.8
pkgrel=3
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra (fix assertion bug in 3.3.8)"
arch=('any')
url='https://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
provides=("eigen=3.3.9")
conflicts=(eigen)
makedepends=('cmake' 'pkg-config' 'freeglut' 'gcc-fortran' 'fftw' 'suitesparse' 'boost')
source=(https://gitlab.com/libeigen/eigen/-/archive/$pkgver/${pkgname%-qfix}-$pkgver.tar.gz
	assert.patch::"https://gitlab.com/libeigen/eigen/-/commit/ef3cc72c.patch"
	pardiso.patch::"https://gitlab.com/libeigen/eigen/-/commit/bfdd4a99.diff")
sha256sums=('146a480b8ed1fb6ac7cd33fec9eb5e8f8f62c3683b3f850094d9d5c35a92419a'
            'c04d624d550b119be0f810786baba7e0d7809edefd4854a2db6dbd98a7da5a7d'
            '0b8304ce62b857b2e1e64f4b61875278dcf26602cc828efdc7b87ba38756dddd')

prepare() {
  patch -d ${pkgname%-qfix}-$pkgver -p1 -i "${srcdir}"/assert.patch
  patch -d ${pkgname%-qfix}-$pkgver -p1 -i "${srcdir}"/pardiso.patch
}

build() {
  cmake -Wno-dev -B build -S "${pkgname%-qfix}-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 "${pkgname%-qfix}-$pkgver"/COPYING.* -t "$pkgdir/usr/share/licenses/${pkgname%-qfix}"
}
