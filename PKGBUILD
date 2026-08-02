# Maintainer: Cyril Waechter <cyril[at]biminsight[dot]ch>
pkgname=python-rdflib-sqlalchemy-git
pkgver=0.5.4.r12.g00822e5
pkgrel=1
pkgdesc="rdflib extension adding SQLAlchemy as an AbstractSQLStore back-end store"
arch=('any')
url="https://github.com/RDFLib/rdflib-sqlalchemy"
license=('BSD-3-Clause')
depends=('python-alembic' 'python-rdflib' 'python-six' 'python-sqlalchemy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}::git+https://github.com/RDFLib/rdflib-sqlalchemy.git")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  DB=sqlite pytest test/test_sqlalchemy_sqlite.py
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
