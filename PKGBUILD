# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rnanorm
pkgver=2.2.0
pkgrel=1
pkgdesc='Common RNA-seq normalization methods'
arch=(any)
url=https://github.com/genialis/RNAnorm
license=(Apache-2.0)
depends=('python' 'python-click' 'python-numpy' 'python-pandas' 'python-scipy' 'python-scikit-learn>=1.6.0' 'python-pandera')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
_commit=abea2c187634465038900b64ac74715a35d871c1
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('38176d0e7d7f9b59357f882d276d0182acd596dfaaf54176b58d416b501a50eb')

prepare() {
  cd "RNAnorm-$_commit"
  # Trial current Arch Python with the complete upstream suite.
  # Upstream currently caps Python below 3.14 without a runtime API guard.
  sed -i 's/>=3.9, <3.14/>=3.9, <3.15/' pyproject.toml
}

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
