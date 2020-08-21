# Maintainer: Marc Cousin <cousinmarc@gmail.com>

pkgname=python-pglast-git
pkgver=v1.10.r44.g76cc90d
pkgrel=1
pkgdesc="PostgreSQL Languages AST and statements prettifier"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/lelit/pglast"
license=('GPL3')
options=('!emptydirs')
source=('git+https://github.com/lelit/pglast.git#branch=v2')
md5sums=('SKIP'
         )
prepare() {
  cd $srcdir/pglast
  git submodule init
  git submodule update
  cd libpg_query
}

pkgver() {
  cd "$srcdir/pglast"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pglast"

  make $(pwd)/libpg_query/tmp/postgres.tar.bz2 -C libpg_query
  make -C libpg_query libpg_query.a
  python setup.py build_ext --inplace
}

package() {
  cd "$srcdir/pglast"

  python setup.py install --root="$pkgdir" --optimize=1
}

