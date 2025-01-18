# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=cppyy-backend
pkgname=python-$_name
pkgver=1.15.3
pkgrel=1
pkgdesc="C/C++ wrapper around Cling for use by cppyy"
arch=(x86_64)
url="https://github.com/wlav/cppyy-backend"
license=(BSD-3-Clause-LBNL)
depends=(
  gcc-libs
  glibc
  python
  # https://github.com/wlav/cppyy-backend/blob/master/clingwrapper/pyproject.toml
  python-cppyy-cling=6.32.8
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=($_name)
replaces=($_name)
source=(
  $url/archive/refs/tags/clingwrapper-$pkgver.tar.gz
  fix-version.patch
  fix-wheel.patch
)
b2sums=('5a8cef0f1490a8c8fc2feebca9f22df5ff3edc5c010a611c198a50d7869990a594ea042ae578ff61015695a4a3084285af82ae1f3484f75e99f5eb53c3c706e0'
        '6d67a4dc0eed31513d1fe126c17c4ea1be7f3b8b57792ec8c149f4a7d6d97426874d2870c3a0424496394923d81e0f6b32341ab1ab1b3be6e7659a5fe47c2891'
        'd99214a0e6dedd75f268e0f3fbc68743828ef443a5990829ac83e6a8fe6cd665043a2fd04b12599be849cb885a88cdeedcb9fc649ecc53aeb97b80dc2a738120')

prepare() {
  cd $_name-clingwrapper-$pkgver
  # fix cppyy-cling version https://github.com/wlav/cppyy-backend/issues/31
  patch -Np1 -i ../fix-version.patch
  # prevent duplicate libcppyy_backend in wheel
  # https://github.com/wlav/cppyy-backend/issues/32
  # https://github.com/wlav/cppyy-backend/commit/da96b938e847a9b338570c5b7596970c46e02ca0
  patch -Np1 -i ../fix-wheel.patch
}

build() {
  cd $_name-clingwrapper-$pkgver/clingwrapper
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-clingwrapper-$pkgver/clingwrapper
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
