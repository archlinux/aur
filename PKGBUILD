# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.16.5
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytest-mock python-pytest-benchmark
              python-pytz pifpaf postgresql)
depends=(python python-scramp)
source=("https://files.pythonhosted.org/packages/source/p/pg8000/pg8000-$pkgver.tar.gz"{,.asc})
sha256sums=('8af70cdfcc1fadafa32468a6af563e1c0b5271c4dcc99a4490030a128cb295a3'
            'SKIP')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

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
