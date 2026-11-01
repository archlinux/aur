# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-sample-classifier
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 classification and regression of biological samples'
arch=(any)
url=https://github.com/qiime2/q2-sample-classifier
license=(BSD-3-Clause)
depends=('python' 'python-qiime2>=2026.10.0' 'python-q2-types>=2026.10.0' 'q2-feature-table>=2026.10.0' 'python-q2templates>=2026.10.0' 'python-biom-format' 'python-scikit-bio' 'python-joblib' 'python-numpy' 'python-pandas' 'python-scipy>=1.15' 'python-scikit-learn' 'python-matplotlib' 'python-seaborn')
optdepends=('python-fastcluster: accelerated hierarchical clustering of large heatmaps')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest')
_commit=efd06401d7e817f510a7a34efd436848d990574d
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'sparse-vectorizer-compat.patch'
        'gradient-boosting-sparse-expectation.patch')
sha256sums=('1e20769d24d394aecdc4517772caffb96da31d018d10c68ed7747250f81aec7f'
            '728a39bc48b17bfff3f93b4da538a0cddc5167dcaf6d0a566e7e51f62b767b10'
            '7eb412562c9737e2a049bef5cc8f1ba223c6ec4d96bd27d886288705299068e5')

prepare() {
  cd "q2-sample-classifier-$_commit"
  patch -Np1 -i "$srcdir/sparse-vectorizer-compat.patch"
  patch -Np1 -i "$srcdir/gradient-boosting-sparse-expectation.patch"
}

build() {
  cd "q2-sample-classifier-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-sample-classifier-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    --pyargs q2_sample_classifier --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_sample_classifier

installed = Path(q2_sample_classifier.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_sample_classifier' and not name.startswith('q2_sample_classifier.'):
        continue
    origin = getattr(module, '__file__', None)
    if origin is None or 'tests' in name.split('.')[1:]:
        continue
    path = Path(origin).resolve()
    assert path.is_relative_to(installed), (name, path)
print('Installed runtime origin check passed:', installed)
raise SystemExit(status)
PYTEST
}

package() {
  cd "q2-sample-classifier-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
