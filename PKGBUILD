# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python38-sqlalchemy
pkgver=1.4.43
pkgrel=2
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('python' 'python38-greenlet')
optdepends=('python38-psycopg2: connect to PostgreSQL database')
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest-runner' 'python38-pytest-xdist')
source=("https://pypi.io/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz"{,.asc})
validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('ee26578874617d46bee8c45e5358e966dafe76d11ff3773a0ce058cfdc180642c87ead782b64e0709aa6af2f92fbcb8a4df3d5e5ce69c9ee3ed4a8583be3b802'
            'SKIP')

prepare() {
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      SQLAlchemy-$pkgver/lib/sqlalchemy/testing/warnings.py
}

build() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/SQLAlchemy-$pkgver
  PYTHONPATH=build/lib pytest
}

package() {
  cd SQLAlchemy-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
