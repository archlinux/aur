# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=duckdb
pkgname=('duckdb' 'python-duckdb')
pkgver=0.3.1
pkgrel=2
pkgdesc="A high-performance analytical database system"
arch=('x86_64')
url="https://duckdb.org"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cmake' 'python-setuptools' 'pybind11' 'python-numpy' 'python-pandas' 'libutf8proc' 'python-pip' 'python-wheel' 'python-setuptools-scm')
_commit='88aa81c6b1b851c538145e6431ea766a6e0ef435'
source=("$pkgbase::git+https://github.com/duckdb/duckdb.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd "$pkgbase"

  python "scripts/amalgamation.py" --extended

  cmake -S . -B "$srcdir/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_VISUALIZER_EXTENSION=1 \
    -DBUILD_ICU_EXTENSION=1 \
    -DBUILD_TPCH_EXTENSION=1 \
    -DBUILD_TPCDS_EXTENSION=1 \
    -DBUILD_FTS_EXTENSION=1 \
    -DBUILD_HTTPFS_EXTENSION=1 \
    -DBUILD_PARQUET_EXTENSION=1 \
    -DBUILD_BENCHMARKS=1 \
    -DBUILD_REST=1 \
    -DAMALGAMATION_BUILD=1
}

build() {
  cmake --build "$srcdir/build"

  python "$srcdir/$pkgbase/tools/pythonpkg/setup.py" build
}

package_duckdb() {
  conflicts=('duckdb-git')
  DESTDIR="$pkgdir" cmake --install build

  # rest server
  install -vDm755 -t "$pkgdir/usr/bin" build/tools/rest/duckdb_rest_server

  # sqlite wrapper
  install -vDm755 -t "$pkgdir/usr/lib" build/tools/sqlite3_api_wrapper/libsqlite3_api_wrapper.so

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgbase" "$pkgbase/LICENSE"
}

package_python-duckdb() {
  pkgdesc+=" (Python API)"
  depends=('python')
  optdepends=('python-numpy' 'python-pandas')
  conflicts=('python-duckdb-git')

  # library
  python "$pkgbase/tools/pythonpkg/setup.py" install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"

  # remove cruft
  rm -rf "$pkgdir/usr/duckdb" "$pkgdir/usr/"*.list
}
