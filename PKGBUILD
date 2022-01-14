# Maintainer : Maël Kerbiriou <m431.ker.biriou+aur at gmail dot com>

pkgbase=duckdb-git
pkgname=('duckdb-git' 'python-duckdb-git')
pkgver=v0.3.1.r996.gf1c8c7ae2
pkgrel=1
pkgdesc="Embeddable SQL OLAP Database Management System"
arch=('x86_64')
url="https://www.duckdb.org/"
license=('MIT')
makedepends=('git' 'cmake' 'python-setuptools' 'pybind11' 'python-numpy' 'python-pandas')
checkdepends=('python-pytest')
depends=('gcc-libs')
source=("${pkgbase}::git+https://github.com/cwida/${pkgbase%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgbase}"
  python "scripts/amalgamation.py"

  cmake -S . -B "${srcdir}/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAMALGAMATION_BUILD=1 \
    -DTREAT_WARNINGS_AS_ERRORS=1 \
    -DBUILD_PARQUET_EXTENSION=1 \
    -DBUILD_REST=1 \
    -DBUILD_UNITTESTS=ON
}

build() {
  cmake --build "${srcdir}/build"

  python "${srcdir}/${pkgbase}/tools/pythonpkg/setup.py" build
}

check() {
  cd "${srcdir}/${pkgbase}"
  "${srcdir}/build/test/unittest"

  cd "${srcdir}/${pkgbase}/tools/pythonpkg"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8" pytest
}

package_duckdb-git() {
  provides=('duckdb')

  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  # Command line and tools do not have a install() decl yet
  for bin in duckdb tools/rest/duckdb_rest_server; do
      install -D -m755 "${srcdir}/build/$bin" \
        "${pkgdir}/usr/bin/$(basename $bin)"
  done

  install -D -m755 "${srcdir}/build/tools/sqlite3_api_wrapper/libsqlite3_api_wrapper.so" \
    "${pkgdir}/usr/lib/libsqlite3_api_wrapper.so"

  install -D -m644 "${srcdir}/${pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-duckdb-git() {
  optdepends=('python-numpy' 'python-pandas')
  provides=('python-duckdb')

  cd "${srcdir}/${pkgbase}/tools/pythonpkg"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 "${srcdir}/${pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
