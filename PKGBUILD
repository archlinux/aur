# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-qiime2
pkgver=2026.10.0
pkgrel=1
pkgdesc='QIIME 2 compatibility API and command line interface'
arch=(any)
url=https://github.com/qiime2/q2
license=(BSD-3-Clause)
depends=('python' 'python-rachis>=2026.10.0' 'rachis-cli>=2026.10.0' 'python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
checkdepends=('python-pytest')
_commit=3e6b00f6fc52c65f7826ea718e5e9b9ebeb3f847
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('2d93c0b48e4aaf3b6139e8e841b4400299fbd46c42f3a80b104fcbcffd65b134')
conflicts=('python-q2cli')
build() {
  cd "q2-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2-$_commit"/dist/*.whl
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    "q2-$_commit/tests" --junitxml="$srcdir/pytest-results.xml" <<'PYTEST'
from pathlib import Path
import sys
import pytest
import qiime2

installed = Path(qiime2.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
import rachis
alias = Path(rachis.__file__).resolve().parent
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'qiime2' and not name.startswith('qiime2.'):
        continue
    origin = getattr(module, '__file__', None)
    if origin is None or 'tests' in name.split('.')[1:]:
        continue
    path = Path(origin).resolve()
    spec = getattr(getattr(module, '__spec__', None), 'name', '')
    is_alias = (spec == 'rachis' or spec.startswith('rachis.'))
    assert (path.is_relative_to(installed)
            or is_alias and path.is_relative_to(alias)), (name, path)
print('Installed runtime origin check passed:', installed)
raise SystemExit(status)
PYTEST
}

package() {
  cd "q2-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
