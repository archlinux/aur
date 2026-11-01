# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2-types
pkgver=2026.10.0
pkgrel=1
pkgdesc='Common QIIME 2 semantic types and data formats'
arch=(any)
url=https://github.com/qiime2/q2-types
license=(BSD-3-Clause)
depends=('python' 'python-qiime2>=2026.10.0' 'python-biom-format' 'python-scikit-bio' 'python-h5py' 'python-pandas' 'python-ijson' 'python-numpy' 'python-scipy' 'python-yaml' 'python-pyhmmer' 'python-frictionless' 'samtools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest')
_commit=34e88d9334a5d9c9a51908e5ae9d21d66cf8959f
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'scikit-bio-0.6.patch')
sha256sums=('02659e650a5b235b940dc0bd38b014d470ca5df9c6bb6cba33b296b8dca2e4be'
            'a06293e47dc6bdfd8c34dcf8cb5a26de2dea991948063ba2337e347a87552368')

prepare() {
  cd "q2-types-$_commit"
  patch -Np1 -i "$srcdir/scikit-bio-0.6.patch"
}

build() {
  cd "q2-types-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-types-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    --pyargs q2_types --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import q2_types

installed = Path(q2_types.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'q2_types' and not name.startswith('q2_types.'):
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
  cd "q2-types-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
