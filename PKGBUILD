# Maintainer: a821
pkgname=python-pynndescent
pkgver=0.5.10
pkgrel=2
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('5d5dc683c03ef55fe3ddf693859720ca18f85c6e6e5bb0b4f14870278d5288ad')

prepare() {
  # remove deprecated distance metric (removed in SciPy 1.11)
  sed -i 's/^ \+"kulsinski",//' "pynndescent-$pkgver/pynndescent/tests/test_distances.py"
}

build() {
  cd "pynndescent-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pynndescent-$pkgver"
  pytest
}

package() {
  cd "pynndescent-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
