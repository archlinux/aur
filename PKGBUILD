# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

_name="sqlalchemy"
pkgname=python-sqlalchemy1.4
pkgver=1.4.52
_ver="rel_${pkgver//./_}"
pkgrel=1
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('glibc' 'python' 'python-greenlet')
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-xdist')
conflicts=('python-sqlalchemy')
provides=('python-sqlalchemy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlalchemy/sqlalchemy/archive/refs/tags/${_ver}.tar.gz")
# https://github.com/sqlalchemy/sqlalchemy/discussions/11138
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('d63ad982073eeeb094dd026ccf92907b829ee12c28a6f1092948077f0112695b1b22c28f9ad2eb7ff063ff8926cb416a1e45102df016ada5c1f866de373bb0e8')

prepare() {
  cd $_name-$_ver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py
}

build() {
  cd $_name-$_ver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$_ver
  PYTHONPATH=build/lib pytest
}

package() {
  cd $_name-$_ver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 ft=sh et:
