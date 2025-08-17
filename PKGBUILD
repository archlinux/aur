# Maintainer: Hasan Çatalgöl < hasancatalgol at gmail.com>
# Package: python-bigframes
#
# BigQuery DataFrames (aka BigFrames). This builds from the PyPI sdist and
# installs the wheel into the Arch filesystem layout.

pkgname=python-bigframes            # Arch naming: python-<modulename>
pkgver=2.15.0                       # Upstream version (update when PyPI updates)
pkgrel=1                            # Increment on packaging-only changes
pkgdesc="BigQuery DataFrames — scalable analytics & ML with BigQuery (BigFrames)"
arch=('any')                        # Pure Python → arch-independent
url="https://github.com/googleapis/python-bigquery-dataframes"
license=('Apache-2.0')              # SPDX identifier

# Runtime dependencies (import/use time). Keep these lean but functional.
depends=(
  'python'                          # CPython runtime
  'python-google-cloud-bigquery'    # BigQuery client (engine calls)
  'python-pandas'                   # pandas-like API surface
  'python-numpy'                    # array/dtype helpers used by the API
  'python-pyarrow'                  # Arrow/Parquet I/O & dtypes
)

# Build-time tools & possible backends.
# - python-build / python-installer / python-wheel: PEP 517 toolchain
# - Some google projects use setuptools; others use hatchling — include both so
#   --no-isolation works regardless of backend.
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-hatchling'
)

# Optional extras surfaced as Arch optdepends (maps to PyPI "Provides-Extra").
optdepends=(
  'python-scikit-learn: ML APIs and model utilities (extra: scikit-learn)'
  'python-polars: enable Polars interop (extra: polars)'
  'python-anywidget: notebook widgets for rich display (extra: anywidget)'
)

# Provide the bare name for reverse deps that might refer to 'bigframes'.
provides=('bigframes')
conflicts=('bigframes')

# PyPI sdist (note: lowercase path segment under /source/<first-letter>/<name>/)
source=("https://files.pythonhosted.org/packages/source/b/bigframes/bigframes-$pkgver.tar.gz")
# Set to SKIP while drafting; run `updpkgsums` to lock in the real SHA256.
sha256sums=('80d68fbead62f40ebff205689fbd1d853e12873ed0a7cc3dfa63944c72573f43')

build() {
  cd "bigframes-$pkgver"
  # Build a wheel using system-installed backends (no isolated venv).
  python -m build --wheel --no-isolation
}

# Upstream tests are cloud-heavy; skip here. Add a smoke import instead if desired.
# check() {
#   cd "bigframes-$pkgver"
#   python - <<'PY'
# import importlib; import sys
# importlib.import_module("bigframes")
# print("bigframes import OK")
# PY
# }

package() {
  cd "bigframes-$pkgver"
  # Install the built wheel into $pkgdir (PEP 517/installer).
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License to the standard location for pacman
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
