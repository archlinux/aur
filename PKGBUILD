# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=1.4.1
pkgrel=1
_pyhash=17fc9b958751f0116d7b0406406b07fa6f5a10c22d699be27826d0b896f9bf51
_pyverstr=cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64
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
b2sums=('1f845cb39965c9d5f5ac5005286aed233ab710d435cbbcd6ebcaaf26db797cd8d5f72e687be2591d9d427f315806fab26d9521d6e8c9335c843bd662282bcb2e'
        'fe97f352d9d2c629f54ef1e209d587fbe4e05cca907ff8118f6e80762a61363cf4ca240dec79d1fd312a347920089bd27f25ff292bb42162f7fbb05967b210ae')

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
    "python"
    "gcc-libs"
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
