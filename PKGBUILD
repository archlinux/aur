# Maintainer: a821 <a821 mail de>
# Contributor: Felix Yan <felixonmars archlinux org>
# Contributor: Stefan Husmann <stefan-husmann t-online de>

pkgname=python-sqlalchemy-git
pkgver=2.0.23.r459.g22cbc7dcb
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('x86_64')
url="https://www.sqlalchemy.org"
license=('custom:MIT')
provides=("python-sqlalchemy")
conflicts=('python-sqlalchemy')
depends=('python' 'python-greenlet' 'python-typing_extensions')
makedepends=(
  'cython' 'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel'
)
optdepends=(
  'python-psycopg2: connect to PostgreSQL database'
)
source=("git+https://github.com/sqlalchemy/sqlalchemy.git")
sha256sums=('SKIP')

pkgver() {
  cd sqlalchemy
  git describe --tags | sed 's/rel_//;s/_/./g;s/-/.r/;s/-/./g;'
}

prepare() {
  cd sqlalchemy
  # remove pinned version dependency on setuptools, otherwise it
  # breaks the build
  sed -i 's/"setuptools.\+",/"setuptools",/' pyproject.toml
}
build() {
  cd sqlalchemy
  python -m build --wheel --no-isolation
}

package() {
  cd sqlalchemy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
