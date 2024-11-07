# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pglast
_pkgname="${pkgname#python-}"
pkgver=6.10
pkgrel=1
pkgdesc='PostgreSQL language AST and statement prettifier'
arch=('x86_64')
url='https://github.com/lelit/pglast'
license=('GPL-3.0-only')
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'github.com-pganalyze-libpg_query::git+https://github.com/pganalyze/libpg_query'
)
sha512sums=('7b9d2006c4b0e657cc41e12ac111fc0fa45cc297fdb4d54cf17fc4f4ab1993bcbcad8eb8722190354cd79cc0f050071158555f90b66932853fa9a35435647d49'
            'SKIP')
b2sums=('83abaf7ff49ca3f285a13dce935611a0b8ecf8596fdc048eea46f9145f1219582ea065b780181d66a0d2f12e5b70ba4143665c0386721c97b567699b9dbe4eb3'
        'SKIP')


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
