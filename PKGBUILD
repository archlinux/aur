# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rnanorm
pkgver=2.3.0
pkgrel=1
pkgdesc='Common RNA-seq normalization methods'
arch=(any)
url=https://github.com/genialis/RNAnorm
license=(Apache-2.0)
depends=('python' 'python-click' 'python-numpy' 'python-pandas' 'python-scipy' 'python-scikit-learn>=1.6.0' 'python-pandera')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
_commit=ca3d4be5f489383dd74d6c891a361d9472ee554e
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('128f7a09487b8003b84b63ca5d03f778565b415499d743119ab5faa40a0000aa')

build() {
  cd "RNAnorm-$_commit"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "RNAnorm-$_commit"/dist/*.whl
  PATH="$srcdir/check-env/bin:$PATH" MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -v \
    "RNAnorm-$_commit/tests" --junitxml="$srcdir/pytest-results.xml"
}

package() {
  cd "RNAnorm-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
