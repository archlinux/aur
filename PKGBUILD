# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.16.1
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytest-mock python-pytz pifpaf postgresql)
depends=(python python-scramp)
source=("https://github.com/tlocke/pg8000/archive/$pkgver/pg8000-$pkgver.tar.gz")
sha256sums=('8af9ba3e1edf249b50b13f9f654aa6d39dd66c959fbbf041a4b66cefeb05c7d9')

prepare() {
  cd pg8000-$pkgver

  # Remove upper bounds of dependencies
  sed --in-place=.orig -r 's#,?<[0-9.]+,?##;s#==([0-9.]+)#>=\1#' setup.py
  diff -u setup.py{.orig,} || true
}

build() {
  cd pg8000-$pkgver
  python setup.py build
}

check() {
  cd pg8000-$pkgver
  # See upstream .travis.yml for initialization SQL commands
  # XXX: The postgres plugin in pifpaf does not listen on a TCP port
  #      without --host
  # XXX: testGss and testSsl needs custom pg_hba.conf and postgresql.conf,
  #      and pifpaf does not support that yet
  PYTHONPATH="$PWD" pifpaf run postgresql --host localhost -- bash -c "
    psql -c \"CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD 'pw';\"
    psql -c \"create extension hstore;\"
    pytest -v test -k 'not testGss and not testSsl'
  "
}

package() {
  cd pg8000-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
