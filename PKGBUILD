# Maintainer: Charlie <c44014189@gmail.com>

_pypi_name=SimpleSQLite
_name="${_pypi_name,,}"

pkgname="python-$_name"
pkgver=1.5.4
pkgrel=1
pkgdesc='Simplify SQLite database operations'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
depends=(
  'python-dataproperty'
  'python-mbstrdecoder'
  'python-pathvalidate'
  'python-sqliteschema'
  'python-tabledata'
  'python-typepy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-docutils'
)

#PyPI only distributes the .whl files, so use github repo
source=("${pkgname%-*}-$_pypi_name-$pkgver.tar.gz::https://github.com/thombashi/$_pypi_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45ca76f04457d1cd08d36fbed064f167451838f47d1407954f99d7c4c96d2aa7')

build() {
  cd "${_pypi_name}-$pkgver"

  python -m build --wheel --no-isolation

  if [ -f README.rst ]; then
    rst2man README.rst "$pkgname.7"
  fi
}

package() {
  cd "${_pypi_name}-$pkgver"

  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir" dist/*.whl

  if [ -f "$pkgname.7" ]; then
    install -Dm644 "$pkgname.7" "$pkgdir/usr/share/man/man7/$pkgname.7"
  fi

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
