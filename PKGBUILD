# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name2=client
_name1=runtime
_name0=pydantic-monty
pkgbase=python-$_name0
pkgname=(python-$_name0-$_name2 python-$_name0-$_name1 python-$_name0)
pkgver=0.0.23
pkgrel=1
arch=('any')
_repo='https://github.com/pydantic/monty'
license=('MIT')
depends=('python')
makedepends=('python-maturin'
             'python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-anyio'
              'python-dirty-equals'
              'python-inline-snapshot'
              'python-opentelemetry-sdk'
              'python-pytest'
              'python-pytest-examples'
              'python-websockets')
options=(!lto)
source=("$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('653bc739256dc511fa7600d1f7ee0a2f392ccbe91018a99e0c62c496197728a9')

prepare() {
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  # ruff >= 0.16 enables SIM117/B018 by default; docs examples predate that
  sed -i "s/ruff_ignore=\['FA102'\]/ruff_ignore=['FA102', 'SIM117', 'B018']/" crates/${_name0//pydantic-/}-python/tests/test_readme_examples.py
  # anyio >= 4.12 parametrizes anyio_backend over every importable backend;
  # AsyncMonty is asyncio-only, so pin the backend instead of pulling in trio
  cat >> crates/${_name0//pydantic-/}-python/tests/conftest.py <<'EOF'

@pytest.fixture(scope='module')
def anyio_backend():
    return 'asyncio'
EOF
}


build() {
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  python -m build --wheel --no-isolation crates/${_name0//pydantic-/}-python
  python -m build --wheel --no-isolation crates/${_name0//pydantic-/}-$_name1
  python -m build --wheel --no-isolation packages/$_name0
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -W "ignore::pytest.PytestRemovedIn10Warning"
  )
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer crates/${_name0//pydantic-/}-python/dist/*.whl
  test-env/bin/python -m installer crates/${_name0//pydantic-/}-$_name1/dist/*.whl
  test-env/bin/python -m installer packages/$_name0/dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" crates/${_name0//pydantic-/}-python/tests
  cargo test --locked --release -j 2 -p ${_name0//pydantic-/}-$_name1
}

package_python-pydantic-monty-client() {
  pkgdesc='Python client for the Monty sandboxed Python interpreter.'
  depends+=('python-typing_extensions' 'glibc' 'libgcc')
  optdepends=('python-opentelemetry-api: opentelemetry')
  url="$_repo/tree/main/crates/${_name0//pydantic-/}-python"
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  python -m installer --destdir="$pkgdir" crates/${_name0//pydantic-/}-python/dist/*.whl
}

package_python-pydantic-monty-runtime() {
  pkgdesc='The monty CLI binary — spawned as worker subprocesses by pydantic-monty.'
  depends=('glibc' 'libgcc')
  url="$_repo/tree/main/crates/${_name0//pydantic-/}-$_name1"
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  python -m installer --destdir="$pkgdir" crates/${_name0//pydantic-/}-$_name1/dist/*.whl
}

package_python-pydantic-monty() {
  pkgdesc='The Monty sandboxed Python interpreter: bindings plus the worker binary.'
  depends+=('python-pydantic-monty-client' 'python-pydantic-monty-runtime')
  optdepends=('python-opentelemetry-api: opentelemetry')
  url="$_repo/tree/main/packages/$_name0"
  cd "$srcdir"/${_name0//pydantic-/}-$pkgver
  python -m installer --destdir="$pkgdir" packages/$_name0/dist/*.whl
}
