# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

_name="sqlalchemy"
pkgname=python-sqlalchemy1.4
pkgver=1.4.54
_ver="rel_${pkgver//./_}"
pkgrel=3
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlalchemy/sqlalchemy/archive/refs/tags/${_ver}.tar.gz"
        "python-314-event-loop-changes.patch")
# https://github.com/sqlalchemy/sqlalchemy/discussions/11138
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('70447ff653f0d7c47855ffbb70d0b75c6982137673543da6dfbd38610eaf817d4fb41841d5495e8c3a953f169b93120ec2e3ab8c04bb7c53c84e8870af633682'
            'ff7ebeac3dfdc01e94df8a883243ff23e0a34f801fa80f5d6e99ca0b14ab433e054e745b2b0d015704cc3dd17ade094f64873268c2b28a7fcd9ae50acdf5371a')

prepare() {
  cd $_name-$_ver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py

  patch -Np1 -i ${srcdir}/python-314-event-loop-changes.patch
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
    --deselect test/ext/test_serializer.py::SerializeTest::test_unicode \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageTest::test_ad_hoc_types \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageTest::test_clone_expression \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageTest::test_tv_render_derived \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageTest::test_type_compile \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_alias_pathing \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_join_cache \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_join_cache_deprecated_coercion \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_key_fallback_result \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_many_discarded_relationships \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_many_updates \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_mapper_reset \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_path_registry \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_session \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_sessionmaker \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_unicode_warnings \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_warnings_util \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_with_inheritance \
    --deselect test/aaa_profiling/test_memusage.py::MemUsageWBackendTest_sqlite+pysqlite_3_51_1::test_with_manytomany
}

package() {
  cd $_name-$_ver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 ft=sh et:
