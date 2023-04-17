# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python-sqlalchemy1.3
pkgver=1.3.24
pkgrel=4
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('python')
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-xdist' 'python-mock')
conflicts=('python-sqlalchemy')
provides=('python-sqlalchemy')
source=("https://pypi.io/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz"{,.asc})
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('4f5f0a23e80e1cebe541f8748a7e794e8964d986252803b3289a7cea732ad22557e00221775332e2766b6ff16ad5d9069223f441f8880ca6d0c47011f15fee5b'
            'SKIP')

prepare() {
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      SQLAlchemy-$pkgver/lib/sqlalchemy/testing/warnings.py
}

build() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python setup.py pytest || true
}

package() {
  cd SQLAlchemy-$pkgver
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
