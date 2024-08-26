#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-numpy-stl
pkgver=3.1.2
pkgrel=1
pkgdesc="Library to make working with STL files (and 3D objects in general) fast and easy"
url="https://github.com/WoLpH/numpy-stl/"
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  'glibc'
  'python-numpy'
  'python-utils'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'xorg-server-xvfb'
)

source=(
  "numpy-stl-v${pkgver}.tar.gz::https://github.com/WoLpH/numpy-stl/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'ef42ddc27e1f644fd451096c4436901b7e5f038de992d903579603731f8b7504'
)

build() {
  cd "numpy-stl-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "numpy-stl-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/"numpy_stl-$pkgver"*.whl

  # Skip some tests which fail on NumPy 2.0.
  local skip_tests=(
    # could not convert string to float: b'np.float32(0.0)'
    'test_ascii_io'

    # Returned values are close to expected, but not close enough.
    'test_mass_properties_for_half_donut'
    'test_mass_properties_for_half_donut_with_density'
  )
  local karg=""
  for testname in "${skip_tests[@]}"; do
    karg="$karg and not $testname"
  done
  karg="${karg:5}"  # Trim the leading ' and '.

  test-env/bin/python -m pytest -vv tests --cov-fail-under=50 -k "$karg"
}

package() {
  cd "numpy-stl-$pkgver"
  python -m installer --destdir="$pkgdir" dist/"numpy_stl-$pkgver"*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
