# Maintainer: Hasan Çatalgöl <hasancatalgol at gmail.com>
# Package: python-dlt
#
# dlt (data load tool) is a Python library/CLI for loading data into
# warehouses/lakes. We build from the PyPI sdist and install the wheel.
#
# Notes:
# - Upstream supports many extras (athena/bigquery/duckdb/etc). We
#   surface major ones via optdepends so users can choose engines.
# - Core package targets Python 3.9–3.14 (per upstream metadata), but
#   we only depend on 'python' since Arch ships a single Python.  See:
#   https://pypi.org/project/dlt/ (Provides-Extra, Python reqs)

pkgname=python-dlt                  # AUR name for Python module 'dlt'
pkgver=1.15.0                       # Upstream version (PyPI)
pkgrel=1                            # Package release number (bump on PKGBUILD changes)
pkgdesc="dlt: data load tool (Python library/CLI) for loading data into warehouses/lakes"
arch=('any')                        # Pure-Python; architecture-independent
url="https://github.com/dlt-hub/dlt" # Upstream project URL
license=('Apache')                  # Apache-2.0 license

# Minimal runtime deps. dlt pulls most functionality via optional extras.
depends=('python')

# Build-time deps for PEP 517/518 wheel build & install.
makedepends=(
  'python-build'                   # python -m build
  'python-installer'               # python -m installer
  'python-wheel'                   # ensure wheel support
  'python-hatchling'               # safe: many projects use hatchling backend
)

# Optional integrations (map popular extras to system packages where available).
# See PyPI's Provides-Extra list for dlt.
optdepends=(
  'python-duckdb: DuckDB destination (extra: duckdb/motherduck)'
  'python-psycopg: PostgreSQL destination (extra: postgres)'
  'python-pymysql: MySQL/MariaDB destination (extra: sql-database)'
  'python-trino: Trino destination (extra: trino)'
  'python-clickhouse-connect: ClickHouse destination (extra: clickhouse)'
  'python-snowflake-connector-python: Snowflake destination (extra: snowflake)'
  'python-google-cloud-bigquery: BigQuery destination (extra: bigquery) [AUR/extra]'
  'python-redshift-connector: Amazon Redshift (extra: redshift) [AUR]'
  'python-pyathena: AWS Athena (extra: athena) [AUR]'
  'python-boto3: AWS S3/Redshift helpers (extras: s3/redshift)'
  'python-pyarrow: Parquet/Arrow utilities (extra: parquet)'
  'python-sqlalchemy: SQL engines support (extra: sqlalchemy)'
)

# Source tarball from PyPI "source/d/dlt/dlt-$pkgver.tar.gz"
source=("https://files.pythonhosted.org/packages/source/d/dlt/dlt-$pkgver.tar.gz")

# Use SKIP while drafting; run `updpkgsums` to pin the actual hash before pushing.
sha256sums=('3dff1419649c984c183ba2ae53bfa60f4d0d7cf3590c1388997886dbe7bfee97')

# build(): create a wheel in an isolated (PEP 517) build environment.
build() {
  cd "dlt-$pkgver"                  # Enter extracted sdist dir
  python -m build --wheel --no-isolation
}

# check(): upstream tests require many extras; skip by default.
#check() { :; }

# package(): install the built wheel into $pkgdir
package() {
  cd "dlt-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License file
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
