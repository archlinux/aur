# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-collada
_pkgname=pycollada
pkgver=0.8
pkgrel=3
pkgdesc="A python COLLADA library"
arch=(any)
url="https://github.com/pycollada/pycollada"
license=(BSD-3-Clause)
depends=(
  python
  python-dateutil
  python-lxml
  python-numpy
  python-pillow
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "numpy2.patch::https://github.com/pycollada/pycollada/commit/39cabd78c4bdbdab763a510be3c2ff378ee9d75b.patch"
)
sha256sums=('0ed3d422c2e287c187a6f744ad9db2d3bfef69f72d3666d037f1e01a245f5cbc'
            'a606bcd62ee5c3747eb9ba8383e8d87de36f1a956a1f4c77a3784ea6ff451930')

prepare() {
  patch -Np1 -d $_pkgname-$pkgver -i $srcdir/numpy2.patch 
}
build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  pytest
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
