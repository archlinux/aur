# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgbase="duckdb"
pkgname=(
  "duckdb"
  "python-duckdb"
)
pkgver=1.4.2
pkgrel=1
_pyhash=2335b1fae4c5245697837f6f63e407fa81e7ccc7948f6ef2b124cd38736f4d1d
_pyverstr=cp314-cp314-manylinux_2_26_x86_64.manylinux_2_28_x86_64
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
b2sums=('cb6ccff7c03d865db66b38fb6a1327b9db4a75b247b2321a58f30394f865e220584007ef5af007433021093d33baf4dd4d03908229c99bd9f3c895891c82c457'
        'e3c31866654be992eb2f26c6cb3f446cc8babd00a45c55cb59c754321c13f0b22d7482abfeeb72d9288461893a3cc83007066b7cb03710c9e33120da263ad54f')

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
