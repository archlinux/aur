# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-opentsne-git
pkgver=1.0.0.r3.g994cf0b
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/pavlin-policar/openTSNE.git"
        "fix_get_numpy_include.patch")
sha256sums=('SKIP'
            'b7e2ef8a66e665851333a93a44dd0d6d657d6d77988dc159a14b14abeead20a1')

pkgver () {
  cd "openTSNE"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd "openTSNE"
  sed -i 's/oldest-supported-//' pyproject.toml
  patch -p1 < ../fix_get_numpy_include.patch
}

build() {
  cd "openTSNE"
  python -m build --wheel --no-isolation
}

package() {
  cd "openTSNE"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
