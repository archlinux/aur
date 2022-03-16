#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-mpmath-git
_pkgname=mpmath
pkgver=1.2.1.r36.gfcc7e53
pkgrel=1
pkgdesc='Python library for arbitrary-precision floating-point arithmetic - git version'
arch=(any)
url='http://mpmath.org/'
license=(BSD)
depends=(python-gmpy2)
makedepends=(python-setuptools-scm)
conflicts=(python-mpmath)
provides=(python-mpmath)
source=(git+https://github.com/fredrik-johansson/mpmath
        mpmath-sage-detection.patch::"https://github.com/fredrik-johansson/mpmath/commit/84ca137f.patch")
sha256sums=('SKIP'
            '16b91c3b2197fce6a0e1a431aa3ad6a5854ec4985bdc479f37382d79e35adb35')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d ${srcdir}/mpmath -Rp1 < mpmath-sage-detection.patch # Fix Sage detection
}

build() {
  cd ${srcdir}/mpmath
  python setup.py build
}

package() {
  cd ${srcdir}/mpmath  

  python setup.py install --root "$pkgdir" --optimize=1

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
