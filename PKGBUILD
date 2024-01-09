# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=0.9.2
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
b2sums=('201273e168607d01c8475b8b524bb1cd898ea59333c4f7fee73686915632153fc6a5673ec00a0cca87f1121e1dd99ebf81dca1e6a4cb8c2d4a20807b74782f6c')

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
