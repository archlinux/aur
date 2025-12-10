# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=1.4.3
pkgrel=1
_pyhash=1a7badf3f611f11997fc429d4b00a730604b65d952417f36a10c4be6e38e064d
_pyverstr=cp313-cp313-manylinux_2_26_x86_64.manylinux_2_28_x86_64
pkgdesc="An in-process SQL OLAP database management system"
arch=("x86_64")
url="https://duckdb.org"
license=("MIT")
depends=(
  "gcc-libs"
  "openssl"
)
makedepends=(
  "git"
  "cmake"
  "python-setuptools"
  "pybind11"
  "python-numpy"
  "python-pandas"
  "libutf8proc"
  "python-pip"
  "python-wheel"
  "python-installer"
  "python-setuptools-scm"
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/duckdb/duckdb/archive/refs/tags/v$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/${_pyhash:0:2}/${_pyhash:2:2}/${_pyhash:4}/duckdb-${pkgver}-$_pyverstr.whl")
b2sums=('9196bd78980c0a035b81b540d3ba1fe5bd0eb613d8a1dfb19808bd8d09fb71af0d1396da1a0a5acca736fa98ccd35fbe723c732e72675e7ee67deaba4026f3f2'
        'd672b63bad5cbce82243232a507d834815fd13a31223eac24dfaab003c937ee0fdc58c05477253061e3325c5b6322fecb3af0cde964582acc27ead2090616ef7')

prepare() {
  cmake \
    -S "$pkgbase-$pkgver" \
    -B build \
    -D OVERRIDE_GIT_DESCRIBE=v$pkgver \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr
}

build() {
  cmake --build build
}

package_duckdb() {

  depends=(
    "glibc"
    "gcc-libs"
  )
  conflicts=("duckdb-bin" "duckdb-git")

  DESTDIR="$pkgdir" cmake --install build

  # sqlite wrapper
  install -vDm755 -t "$pkgdir/usr/lib" build/tools/sqlite3_api_wrapper/libsqlite3_api_wrapper.so

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgbase" "$pkgbase-$pkgver/LICENSE"
}

package_python-duckdb() {

  pkgdesc+=" (Python API)"
  depends=(
    "glibc"
    "gcc-libs"
    "python"
    "ipython"
    "python-fsspec"
    "python-polars"
    "python-pyarrow"
    "python-typing_extensions"
  )
  optdepends=(
    "python-numpy"
    "python-pandas"
  )
  conflicts=("python-duckdb-git")

  # library
  python -m installer --destdir="${pkgdir}" *.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase-$pkgver/LICENSE"

  # remove cruft
  rm -rf "$pkgdir/usr/duckdb" "$pkgdir/usr/duckdb_build" "$pkgdir/usr/"*.list
}
