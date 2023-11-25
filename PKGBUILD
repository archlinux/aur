# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_name=${pkgname#python-}
pkgver=5.10.0
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=(any)
url="https://github.com/pymc-devs/pymc"
license=(MIT)
depends=(
  ipython
  python
  python-arviz
  python-cachetools
  python-cloudpickle
  python-fastprogress
  python-graphviz
  python-matplotlib
  python-networkx
  python-numpy
  python-pandas
  python-pytensor
  python-pytest
  python-scipy
  python-typing_extensions
  python-xarray
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54c95d7fe966557a4dd63f930fb074d11cf7c31f85f4d34eb2360397f2cd694b')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    tests/test_initial_point.py \
    tests/test_math.py \
    tests/test_model_graph.py \
    tests/test_printing.py \
    tests/test_pytensorf.py \
    tests/test_testing.py \
    tests/test_util.py \
    -k "\
      not test_softmax_logsoftmax_no_warnings \
      and not TestImputationModel \
    "
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
