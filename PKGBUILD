# Maintainer: Hasan Catalgol <hasan@dekatechs.com>
# Package: python-sqlmesh
#
# This PKGBUILD builds SQLMesh from the PyPI sdist, installs it,
# and exposes an extras helper to (optionally) install integrations on demand.
#
# Notes:
# - Upstream supports *many* extras. Per Arch practice we surface those
#   via optdepends (system packages where reasonable) and provide a helper
#   to install them (from repos/AUR) when you want.
# - Core runtime: upstream requires sqlglot. Because 'python-sqlglot' is
#   typically in the AUR (not official repos), we *don’t* hard-require it
#   as a pacman dependency (that would break `makepkg -si`); instead, the
#   post-install script will suggest (and can auto-install) it. You can
#   also run:  sqlmesh-extras-helper ensure-core

pkgname=python-sqlmesh
pkgver=0.209.0
pkgrel=4
pkgdesc="Scalable, efficient data transformation framework (dbt-compatible) – SQLMesh CLI"
arch=('any')
url="https://github.com/TobikoData/sqlmesh"
license=('Apache')
depends=(
  'python'
  'python-sqlglot'
  'python-hyperscript'
  'python-click'
  'python-dateparser'
  'python-croniter'
  'python-tenacity'
  'python-jinja'
  'python-requests'
  'python-rich'
  'python-ruamel-yaml'
  'python-dotenv'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')

# Optional extras as system packages where available (others note AUR/pip).
# See: https://pypi.org/project/sqlmesh/ (Provides-Extra list)
optdepends=(
  # ---- Web / LSP ----
  'python-fastapi: web UI / API server (extra: web)'
  'uvicorn: ASGI server for web UI (extra: web)'
  'python-jinja: templated UI bits (extra: web)'
  'python-pygls: Language Server Protocol (extra: lsp)'

  # ---- Engines / Warehouses ----
  'python-duckdb: DuckDB engine (extra: duckdb, also used by motherduck)'
  'python-psycopg: PostgreSQL / Redshift / RisingWave PG-wire (extras: postgres, redshift, risingwave)'
  'python-pymysql: MySQL / MariaDB engine (extra: mysql)'
  'python-pyodbc: ODBC client for MSSQL/AzureSQL ODBC (extras: mssql-odbc, azuresql-odbc)'
  'unixodbc: ODBC driver manager for *-odbc extras'
  'python-pymssql: Native MSSQL driver (extra: mssql) [AUR]'
  'python-clickhouse-connect: ClickHouse engine (extra: clickhouse)'
  'python-trino: Trino engine (extra: trino)'
  'snowflake-connector-python: Snowflake engine (extra: snowflake)'
  'python-google-cloud-bigquery: BigQuery engine (extra: bigquery)'

  # ---- Cloud specifics / helpers ----
  'python-boto3: AWS integrations (extras: athena, redshift, mwaa, secrets)'
  'python-pyathena: AWS Athena connector (extra: athena) [AUR]'
  'python-redshift-connector: Amazon Redshift connector (extra: redshift) [AUR]'
  'python-azure-identity: Azure auth for AzureSQL (extras: azuresql, azuresql-odbc)'
  'msodbcsql17: Microsoft ODBC driver for SQL Server (extras: mssql-odbc, azuresql-odbc) [AUR]'
  'python-cloud-sql-python-connector: GCP Cloud SQL Postgres (extra: gcppostgres) [AUR]'

  # ---- Integrations / Tooling ----
  'dbt-core: dbt compatibility layer (extra: dbt) [AUR]'
  'python-dlt: dlt ingestion (extra: dlt) [AUR]'
  'python-pygithub: GitHub CI/CD bot (extra: github)'
  'python-slack-sdk: Slack notifications (extra: slack)'
  'python-openai: LLM features (extra: llm)'
  'python-databricks-sql-connector: Databricks SQL (extra: databricks) [AUR]'
  'python-motherduck: MotherDuck client (extra: motherduck) [AUR]'
  'python-bigframes: BigFrames / BigQuery DataFrames (extra: bigframes) [AUR/pip]'
)

# Source from PyPI sdist; wheel is built locally.
source=("https://files.pythonhosted.org/packages/source/s/sqlmesh/sqlmesh-$pkgver.tar.gz")
sha256sums=('2a0bc3c23edbc3a16478c048081cf332cb61d3c0d1712278968ef9aec55684f5')

# Optional post-install script to nudge core deps & show tips.
install="$pkgname.install"

build() {
  cd "sqlmesh-$pkgver"
  python -m build --wheel --no-isolation
}

# Upstream tests require many extras; skip here.
# check() { :; }

package() {
  cd "sqlmesh-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # ---- helper to install extras on demand ----
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/sqlmesh-extras-helper" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

# Helper that tries to install SQLMesh extras with system packages where possible.
# Usage:
#   sqlmesh-extras-helper ensure-core              # installs python-sqlglot if missing
#   sqlmesh-extras-helper install web postgres ... # installs listed extras

have() { command -v "$1" >/dev/null 2>&1; }
as_root() { [[ $EUID -eq 0 ]] && echo yes || echo no; }

# For AUR names that vary, we’ll try a few candidates.
try_aur() {
  local name
  for name in "$@"; do
    if have yay; then
      yay -S --noconfirm --needed "$name" && return 0 || true
    fi
  done
  return 1
}

install_repo() { sudo pacman -S --noconfirm --needed "$@" ; }
install_aur_or_hint() {
  local name="$1"
  if have yay; then
    yay -S --noconfirm --needed "$name" || return 1
  else
    echo ">> AUR package '$name' requires an AUR helper (e.g., yay)."
    echo "   Install yay, or use pip in a venv:  python -m venv .venv && . .venv/bin/activate && pip install $name"
    return 1
  fi
}

ensure_core() {
  # sqlglot is mandatory at runtime
  python - <<'PY' || {
    echo ">> Missing python-sqlglot. Trying to install…"
    if pacman -Si python-sqlglot >/dev/null 2>&1; then
      install_repo python-sqlglot
    else
      try_aur python-sqlglot || install_aur_or_hint python-sqlglot
    fi
  }
import importlib, sys
try:
    importlib.import_module("sqlglot")
except Exception as e:
    sys.exit(1)
print("sqlglot OK")
PY
}

install_extra() {
  local extra="$1"
  case "$extra" in
    # ---------- Web / LSP ----------
    web)         install_repo python-fastapi python-uvicorn python-jinja ;;
    lsp)         install_repo python-pygls ;;
    # ---------- Engines ----------
    duckdb)      install_repo python-duckdb ;;
    postgres)    install_repo python-psycopg || install_repo python-psycopg2 ;;
    risingwave)  install_repo python-psycopg || install_repo python-psycopg2 ;;  # PG-wire compat
    mysql)       install_repo python-pymysql ;;
    trino)       install_repo python-trino ;;
    clickhouse)  install_repo python-clickhouse-connect ;;
    snowflake)   install_repo python-snowflake-connector-python ;;
    bigquery)    install_repo python-google-cloud-bigquery ;;
    motherduck)  { install_repo python-duckdb || true; } && ( install_repo python-motherduck 2>/dev/null || install_aur_or_hint python-motherduck || true )
                  echo "Note: MotherDuck often works with duckdb + auth token." ;;
    # ---------- Microsoft / Azure ----------
    mssql)       install_aur_or_hint python-pymssql ;;
    mssql-odbc)  install_repo python-pyodbc unixodbc && ( try_aur msodbcsql19-bin msodbcsql18-bin msodbcsql17-bin || echo ">> Install Microsoft ODBC driver from AUR manually." ) ;;
    azuresql)    install_repo python-azure-identity && ( install_aur_or_hint python-pymssql || true ) ;;
    azuresql-odbc) install_repo python-azure-identity python-pyodbc unixodbc && ( try_aur msodbcsql19-bin msodbcsql18-bin msodbcsql17-bin || echo ">> Install Microsoft ODBC driver from AUR manually." ) ;;
    # ---------- AWS / GCP ----------
    athena)      install_repo python-boto3 && ( install_aur_or_hint python-pyathena || true ) ;;
    redshift)    install_repo python-boto3 && ( install_repo python-redshift-connector 2>/dev/null || install_aur_or_hint python-redshift-connector || true ) ;;
    mwaa)        install_repo python-boto3 ;;
    gcppostgres) install_aur_or_hint python-google-cloud-sql-connector || true ;;
    # ---------- Tooling / Integrations ----------
    dbt)         install_aur_or_hint dbt-core ;;
    dlt)         install_aur_or_hint python-dlt ;;
    github)      install_repo python-pygithub ;;
    slack)       install_repo python-slack-sdk ;;
    llm)         install_repo python-openai ;;
    databricks)  install_aur_or_hint python-databricks-sql-connector || true ;;
    bigframes)   install_aur_or_hint python-bigframes || { echo ">> BigFrames may require pip in a venv: pip install bigframes"; true; } ;;
    dev)         echo ">> 'dev' extra is a meta group for contributors. Use pip in a venv if needed." ;;
    *)
      echo "Unknown extra: $extra"
      return 2 ;;
  esac
}

main() {
  [[ $# -ge 1 ]] || { echo "Usage: $0 ensure-core | install <extra...>"; exit 64; }
  case "$1" in
    ensure-core) ensure_core ;;
    install)     shift; [[ $# -ge 1 ]] || { echo "Specify at least one extra."; exit 64; }
                 for x in "$@"; do install_extra "$x"; done ;;
    *) echo "Usage: $0 ensure-core | install <extra...>"; exit 64;;
  esac
}

main "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/sqlmesh-extras-helper"
}
