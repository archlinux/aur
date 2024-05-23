# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=0.10.3
pkgrel=1
pkgdesc="An in-process SQL OLAP database management system"
arch=("x86_64" "aarch64" "armv7h")
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
source=("$pkgbase-$pkgver.tar.gz::https://github.com/duckdb/duckdb/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7c8f0bb3261c525df38e54f7da43387f4e8e4d641fe8fb879ea9d5de0edd997b5533650ef03f15965dd8f4ee6b50e1c5ad6231b6559cba17c1f8b1b727df4091')

prepare() {
  cmake \
    -S "$pkgbase-$pkgver" \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr
}

build() {
  cmake --build build

  python "$pkgbase-$pkgver/tools/pythonpkg/setup.py" build
}

package_duckdb() {
  conflicts=("duckdb-git")
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
  python "$pkgbase-$pkgver/tools/pythonpkg/setup.py" install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgbase-$pkgver/LICENSE"

  # remove cruft
  rm -rf "$pkgdir/usr/duckdb" "$pkgdir/usr/duckdb_build" "$pkgdir/usr/"*.list
}
