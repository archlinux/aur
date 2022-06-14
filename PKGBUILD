# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Tim Hütz <tim@huetz.biz>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>
pkgname=python2-mpi4py
_name=${pkgname#python2-}
pkgver=3.1.3
pkgrel=2
pkgdesc="Python2 bindings of the Message Passing Interface (MPI)"
depends=('python2' 'openmpi')
arch=('i686' 'x86_64')
url='https://github.com/mpi4py/mpi4py'
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-numpy')
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('f1e9fae1079f43eafdd9f817cdb3fd30d709edc093b5d5dada57a461b2db3008')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  for n in 1 2; do
    mpiexec -n $n python2 test/runtests.py -e spawn
    PYTHONPATH=$(printf '%s' build/lib*) mpiexec -n $n \
      python2 -m mpi4py.futures demo/futures/test_futures.py
  done
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
