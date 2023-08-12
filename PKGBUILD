# Maintainer: a821
# Contributor: Michel Zou

pkgname=python-opentsne
pkgver=1.0.0
pkgrel=2
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz"
        "fix_get_numpy_include.patch")
sha256sums=('03dafa41632ece9e9217d78769ed2d65e6086bdcab8bc8631d115b7d0ad06763'
            'b7e2ef8a66e665851333a93a44dd0d6d657d6d77988dc159a14b14abeead20a1')

prepare() {
  cd "openTSNE-$pkgver"
  sed -i 's/oldest-supported-//' pyproject.toml
  patch -p1 < ../fix_get_numpy_include.patch
}

build() {
  cd "openTSNE-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "openTSNE-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
