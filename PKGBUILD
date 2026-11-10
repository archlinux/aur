# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-parsl
pkgver=2026.11.9
pkgrel=1
pkgdesc='Parallel Python workflows with data dependency tracking'
arch=(any)
url=https://github.com/Parsl/parsl
license=(Apache-2.0)
depends=('python' 'python-pyzmq' 'python-typeguard' 'python-typing_extensions' 'python-dill' 'python-tblib' 'python-requests' 'python-sortedcontainers' 'python-psutil' 'python-setproctitle' 'python-filelock')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-sqlalchemy' 'python-numpy' 'python-pandas')
_commit=bbfefb75118b9586bf276732e3cb5f9948242a6f
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        pytest9-path-hook.patch)
sha256sums=('dcc1aea39baa9c9dd32fe30a887c0474717087d81b45d2eb0f4a631c92b0c4bc'
            'a51ee1f7da5aab4b907e0536efc3c6285e0b50930a6dca4f7e18b98836fbce43')
optdepends=('python-sqlalchemy: workflow monitoring' 'python-boto3: AWS execution' 'python-kubernetes: Kubernetes execution' 'python-google-api-python-client: Google Cloud execution' 'python-globus-sdk: Globus data transfers' 'python-networkx: workflow visualization' 'python-pydot: workflow visualization' 'python-flask: workflow visualization' 'python-flask-sqlalchemy: workflow visualization' 'python-pandas: workflow visualization' 'python-plotly: workflow visualization' 'python-daemon: visualization server')
prepare() {
  cd "parsl-$_commit"
  # Match upstream release CI, since Git tags retain the development version.
  VERSION="$pkgver" bash tag_and_release.sh update_version
  # pytest 9 removed the legacy py.path hook argument.
  patch -Np1 -i "$srcdir/pytest9-path-hook.patch"
}

build() {
  cd "parsl-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "parsl-$_commit"/dist/*.whl
  # Exercise local thread/dataflow behavior without external execution providers.
  local tests="parsl-$_commit/parsl/tests"
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -v \
    --config "$tests/configs/local_threads.py" \
    "$tests/test_python_apps/test_basic.py" \
    "$tests/test_python_apps/test_pipeline.py" \
    "$tests/test_python_apps/test_futures.py" \
    "$tests/test_python_apps/test_dependencies.py" \
    "$tests/test_python_apps/test_dep_standard_futures.py" \
    "$tests/test_python_apps/test_depfail_propagation.py" \
    "$tests/test_python_apps/test_join.py" \
    "$tests/test_python_apps/test_memoize_1.py" \
    --junitxml="$srcdir/pytest-dataflow.xml"
  MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -v \
    --config local \
    "$tests/test_threads/test_configs.py" \
    "$tests/test_threads/test_lazy_errors.py" \
    "$tests/test_python_apps/test_memoize_exception.py" \
    "$tests/test_error_handling/test_retries.py" \
    "$tests/test_serialization/test_basic.py" \
    "$tests/unit/executors/high_throughput/test_interchange.py" \
    --junitxml="$srcdir/pytest-local.xml"
}

package() {
  cd "parsl-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # The upstream suite is exercised by check(), not installed as runtime code.
  rm -r "$pkgdir"/usr/lib/python*/site-packages/parsl/tests
  python - "$pkgdir" <<'PYTHON'
import csv
import pathlib
import sys
record = next(pathlib.Path(sys.argv[1]).glob("usr/lib/python*/site-packages/parsl-*.dist-info/RECORD"))
with record.open(newline="") as source:
    rows = [row for row in csv.reader(source) if not row[0].startswith("parsl/tests/")]
with record.open("w", newline="") as target:
    csv.writer(target).writerows(rows)
PYTHON
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
