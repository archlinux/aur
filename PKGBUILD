# Maintainer: Hasan Catalgol <hasacatalgol at gmail.com>
# This PKGBUILD packages the PyPI project "PyAthena" for Arch Linux as `python-pyathena`.

pkgname=python-pyathena            # Arch package name for Python libs is `python-<modulename>`
_pypiname=PyAthena                 # Project name on PyPI
_pypiname_lc=${_pypiname,,}        # Lowercased name; PyPI normalizes sdists to lowercase
pkgver=3.17.1                      # Upstream version
pkgrel=1                           # Packaging release (bump when PKGBUILD changes)
pkgdesc="Python DB API 2.0 client for Amazon Athena"
arch=('any')                       # Pure Python → architecture-independent
url="https://github.com/laughingman7743/PyAthena"
license=('MIT')

# Runtime deps
depends=(
  'python'                         # CPython runtime
  'python-boto3'                   # AWS SDK (pulls in python-botocore)
  'python-tenacity'                # Retry/backoff helper
)

# Build-time deps (PEP 517)
makedepends=(
  'python-build'                   # Build wheel
  'python-installer'               # Install wheel into $pkgdir
  'python-wheel'                   # Wheel tooling
  'python-setuptools'              # Upstream backend (safe to keep)
  'python-hatchling'               # build backend required by pyproject.toml
)

# Optional extras
optdepends=(
  'python-sqlalchemy: SQLAlchemy dialect support (extra: [sqlalchemy])'
  'python-pandas: DataFrame integration (extra: [pandas])'
  'python-pyarrow: Arrow-based cursor (extra: [arrow])'
  'python-fastparquet: fastparquet cursor (extra: [fastparquet])'
)

# Source: PyPI uses lowercase paths for sdists
source=("${_pypiname_lc}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname_lc:0:1}/${_pypiname_lc}/${_pypiname_lc}-${pkgver}.tar.gz")
sha256sums=('8e54baaa3386dacc93a6c63f8cd92994e50b8833d747772659231ae4ef4418f7')

build() {
  # NOTE: the extracted directory is lowercase (`pyathena-${pkgver}`)
  cd "${srcdir}/${_pypiname_lc}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypiname_lc}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License to standard location
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Optional quick import test (uncomment if you like)
# check() {
#   cd "${srcdir}/${_pypiname_lc}-${pkgver}"
#   python - <<'PY'
# import pyathena, sys
# print("PyAthena import OK, version:", pyathena.__version__)
# PY
# }
