# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=1.4.0
pkgrel=1
_pyhash=a0837438fb43be451a7d4a04650aaaf662b2ff2d95895bbffe3e0e28cbe030c9
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
  "python-setuptools-scm"
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/duckdb/duckdb/archive/refs/tags/v$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/${_pyhash:0:2}/${_pyhash:2:2}/${_pyhash:4}/duckdb-${pkgver}-$_pyverstr.whl")
b2sums=('22e768dc3a0e2cb197c9ebd111a453d8a51aede61404d3c49d4e0e4507b655c675c72e506baa7b0834d49ba4687a76b2b13965051cd0d1a1cd4d442964345881'
        '5b7a7d1d36713d3363a1647e0c82f1da2ad8ed88a0c1c5cf219d38a304495c469e9c5fd54c414f2842f3410616e64b0f79ca3dd0258b103256889309df4acda3')

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
