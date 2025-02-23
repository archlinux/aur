# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=sqlalchemy-cockroachdb
pkgname=python-${_name}
pkgver=2.0.2
pkgrel=2
pkgdesc='CockroachDB dialect for SQLAlchemy.'
arch=('any')
url='https://github.com/cockroachdb/sqlalchemy-cockroachdb'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('119756eb905855d6a11345b99cfe853031a3fe598a9c4bf35a8ddac9f89fe8cc')
depends=('python>=3.8' 'python-sqlalchemy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-alembic' 'python-asyncpg' 'python-mock' 'python-more-itertools' 'python-psycopg' 'python-psycopg2' 'python-pytest' 'python-sqlalchemy' 'cockroachdb')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --ignore test/test_suite_alembic.py
  )
  cd "${srcdir}"/${_name}-${pkgver}
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
