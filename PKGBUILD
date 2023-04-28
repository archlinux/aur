# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pglast
_pkgname="${pkgname#python-}"
pkgver=5.1
pkgrel=1
pkgdesc='PostgreSQL language AST and statement prettifier'
arch=('x86_64')
url='https://github.com/lelit/pglast'
license=('GPL3')
depends=('python' 'python-setuptools')
makedepends=(
  'git'
  'cython'
  'protobuf-c'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
)
checkdepends=('python-pytest' 'python-pytest-cov')
_commit='2ee74d4426e63d9d825da1bb7bd5a6b393c6f192'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'github.com-pganalyze-libpg_query::git+https://github.com/pganalyze/libpg_query'
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init 
  git config submodule.libpg_query.url "$srcdir/github.com-pganalyze-libpg_query"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation

  # generate documentation
  make -C docs html
}

check() {
  cd "$pkgname"

  local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"

  PYTHONPATH="build/lib.linux-${CARCH}-cpython-${python_version}:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname" 
  cp -vr docs/_build/html/* "$pkgdir/usr/share/doc/$pkgname"
}
