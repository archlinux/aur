# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

_name="sqlalchemy"
pkgname=python-sqlalchemy1.4
pkgver=1.4.54
_ver="rel_${pkgver//./_}"
pkgrel=2
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('glibc' 'python' 'python-greenlet')
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-xdist')
conflicts=('python-sqlalchemy')
provides=('python-sqlalchemy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlalchemy/sqlalchemy/archive/refs/tags/${_ver}.tar.gz")
# https://github.com/sqlalchemy/sqlalchemy/discussions/11138
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('70447ff653f0d7c47855ffbb70d0b75c6982137673543da6dfbd38610eaf817d4fb41841d5495e8c3a953f169b93120ec2e3ab8c04bb7c53c84e8870af633682')

prepare() {
  cd $_name-$_ver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py
}

build() {
  cd $_name-$_ver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$_ver
  # Deselect tests failing on Python 3.13 - reported by Fedora as well, see:
  # https://github.com/sqlalchemy/sqlalchemy/pull/11500
  PYTHONPATH=build/lib pytest \
    --deselect test/orm/test_mapper.py::MapperTest::test_synonym_nonexistent_attr \
    --deselect test/ext/test_serializer.py::ColumnPropertyWParamTest::test_deserailize_colprop \
    --deselect test/ext/test_serializer.py::SerializeTest::test_aliases \
    --deselect test/ext/test_serializer.py::SerializeTest::test_annotated_one \
    --deselect test/ext/test_serializer.py::SerializeTest::test_any \
    --deselect test/ext/test_serializer.py::SerializeTest::test_attribute \
    --deselect test/ext/test_serializer.py::SerializeTest::test_columns \
    --deselect test/ext/test_serializer.py::SerializeTest::test_expression \
    --deselect test/ext/test_serializer.py::SerializeTest::test_mapper \
    --deselect test/ext/test_serializer.py::SerializeTest::test_orm_join \
    --deselect test/ext/test_serializer.py::SerializeTest::test_query_one \
    --deselect test/ext/test_serializer.py::SerializeTest::test_query_three \
    --deselect test/ext/test_serializer.py::SerializeTest::test_query_two \
    --deselect test/ext/test_serializer.py::SerializeTest::test_tables \
    --deselect test/ext/test_serializer.py::SerializeTest::test_unicode
}

package() {
  cd $_name-$_ver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 ft=sh et:
