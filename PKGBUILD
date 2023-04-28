# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=duckdb
pkgname=(
  'duckdb'
  'python-duckdb'
)
pkgver=0.7.1
pkgrel=1
pkgdesc='A high-performance analytical database system'
arch=('x86_64')
url='https://duckdb.org'
license=('MIT')
depends=(
  'gcc-libs'
  'openssl'
)
makedepends=(
  'git'
  'cmake'
  'python-setuptools'
  'pybind11'
  'python-numpy'
  'python-pandas'
  'libutf8proc'
  'python-pip'
  'python-wheel'
  'python-setuptools-scm'
)
_commit='b00b93f0b14bfff869e1facfd86a6b556a6f1c6e'
source=("$pkgbase::git+https://github.com/duckdb/duckdb.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cmake \
    -S "$pkgbase" \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_VISUALIZER_EXTENSION=1 \
    -D BUILD_ICU_EXTENSION=1 \
    -D BUILD_TPCH_EXTENSION=1 \
    -D BUILD_TPCDS_EXTENSION=1 \
    -D BUILD_FTS_EXTENSION=1 \
    -D BUILD_HTTPFS_EXTENSION=1 \
    -D BUILD_PARQUET_EXTENSION=1
}

build() {
  cmake --build build

  python "$pkgbase/tools/pythonpkg/setup.py" build
}

package_duckdb() {
  conflicts=('duckdb-git')
  DESTDIR="$pkgdir" cmake --install build

  # sqlite wrapper
  install -vDm755 -t "$pkgdir/usr/lib" build/tools/sqlite3_api_wrapper/libsqlite3_api_wrapper.so

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgbase" "$pkgbase/LICENSE"
}

package_python-duckdb() {
  pkgdesc+=" (Python API)"
  depends=(
    'python'
    'gcc-libs'
  )
  optdepends=(
    'python-numpy'
    'python-pandas'
  )
  conflicts=('python-duckdb-git')

  # library
  python "$pkgbase/tools/pythonpkg/setup.py" install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase/LICENSE"

  # remove cruft
  rm -rf "$pkgdir/usr/duckdb" "$pkgdir/usr/"*.list
}
