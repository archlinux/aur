# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=q2-feature-classifier
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 taxonomic classification of biological sequences'
arch=(any)
url=https://github.com/qiime2/q2-feature-classifier
license=(BSD-3-Clause)
depends=('python' 'python-qiime2>=2026.10.0' 'python-q2-types>=2026.10.0' 'python-biom-format' 'python-scikit-bio' 'python-joblib' 'python-numpy' 'python-pandas' 'python-scipy' 'python-scikit-learn' 'vsearch' 'blast+' 'q2-feature-table>=2026.10.0' 'q2-quality-control>=2026.10.0' 'q2-taxa>=2026.10.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest')
_commit=559c0251bf4a7c3fe7e9cc7267207cc39059c784
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('fdebb27ae186b0f5e2ae240f1130e6c28d1c3f58b30f883f8b65bebf6fd62046')

build() {
  cd "q2-feature-classifier-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-feature-classifier-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    --pyargs q2_feature_classifier --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_feature_classifier

installed = Path(q2_feature_classifier.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_feature_classifier' and not name.startswith('q2_feature_classifier.'):
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
  cd "q2-feature-classifier-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
