# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>

pkgname=python-srsly-git
_origpkgname=srsly
pkgver=2.4.8.r1.g4aba49f
pkgrel=1
pkgdesc="Modern high-performance serialization utilities for Python"
arch=("x86_64")
url="https://github.com/explosion/srsly"
license=("MIT")
depends=('python'
         'python-numpy'
         'cython'
         'python-pytest'
         'python-mock'
         'python-pytz'
         'python-catalogue'
         'python-pytest-timeout'
)
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('python-srsly')
conflicts=('python-srsly')
source=("git+https://github.com/explosion/$_origpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_origpkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_origpkgname"
  sed -i 's/ctypedef unsigned long long uint64_t/from libc.stdint cimport uint64_t/' srsly/msgpack/_unpacker.pyx
  sed -i 's/,<0.30.0//' setup.cfg
  sed -i 's/,<0.30.0//' pyproject.toml
  sed -i 's/,<0.30.0//' requirements.txt
}

build() {
  cd "${_origpkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_origpkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
