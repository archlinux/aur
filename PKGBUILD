# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=sqlalchemy-cockroachdb
pkgname=python-${_name}
pkgver=2.0.2
pkgrel=3
pkgdesc='CockroachDB dialect for SQLAlchemy.'
arch=('x86_64' 'aarch64')
url='https://github.com/cockroachdb/sqlalchemy-cockroachdb'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://binaries.cockroachdb.com/cockroach-v24.3.8.linux-amd64.tgz")
source_aarch64=("https://binaries.cockroachdb.com/cockroach-v24.3.8.linux-arm64.tgz")
sha256sums=('03fbb61ae8230963609da468301c18678889a200f6ffd0f057b57065be8fb99f')
sha256sums_x86_64=('ebd27dbf7d4713a81aa534b9ba00f89ba970a6d20c37a7a0e73fd139147fa760')
sha256sums_aarch64=('3fc03415d4f96c36258ccf141b5d6ab0fc3e51e9e670eeb6cf695ad064bfcbbb')
depends=('python>=3.8' 'python-sqlalchemy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-alembic' 'python-asyncpg' 'python-mock' 'python-more-itertools' 'python-psycopg' 'python-psycopg2' 'python-pytest' 'python-sqlalchemy')

prepare(){
  rm -rf cockroachdb
  if [ -d "cockroach-v24.3.8.linux-amd64" ]; then
    mv -f cockroach-v24.3.8.linux-amd64 cockroachdb
  else
    mv -f cockroach-v24.3.8.linux-arm64 cockroachdb
  fi
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/cockroachdb
  ./cockroach start-single-node --insecure --background || true
  ./cockroach init --insecure || true
  ./cockroach sql --insecure -e 'CREATE SCHEMA test_schema; CREATE SCHEMA test_schema_2;' || true
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name}-${pkgver}
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  for db in asyncpg psycopg psycopg2; do
    rm -rf scratch
    db_name=$([[ "$db" == "asyncpg" ]] && echo "${db}_async" || echo "$db")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.ANY-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.ANY-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE|MATERIALIZED_VIEW-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE|MATERIALIZED_VIEW-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE|VIEW-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[False-ObjectKind.TABLE|VIEW-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.ANY-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.ANY-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE|MATERIALIZED_VIEW-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE|MATERIALIZED_VIEW-ObjectScope.DEFAULT-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE|VIEW-ObjectScope.ANY-None-_exclusions_00]")
    pytest_options+=("--deselect" "test/test_suite_sqlalchemy.py::ComponentReflectionTest_cockroachdb+${db_name}_9_5_0::test_get_multi_check_constraints[True-ObjectKind.TABLE|VIEW-ObjectScope.DEFAULT-None-_exclusions_00]")
    test-env/bin/python -m pytest "${pytest_options[@]}" test --db="$db"
  done
  pkill -f cockroach
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
