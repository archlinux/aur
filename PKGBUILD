# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.17.0
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytest-mock python-pytest-benchmark
              python-pytz pifpaf postgresql)
depends=(python python-scramp)
source=("https://files.pythonhosted.org/packages/source/p/pg8000/pg8000-$pkgver.tar.gz"{,.asc}
        pghost-unix-sock.patch::https://github.com/tlocke/pg8000/pull/64.patch)
sha256sums=('14198c5afeb289106e40ee6e5e4c0529c5369939f6ca588a028b371a75fe20dd'
            'SKIP'
            '0a851dbbc0f8d0116795eb0d875e9178659bdf7c6964bff8b26c6b014c37e9c9')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

prepare() {
  cd pg8000-$pkgver

  # Remove upper bounds of dependencies
  sed --in-place=.orig -r 's#,?<[0-9.]+,?##;s#==([0-9.]+)#>=\1#' setup.py
  diff -u setup.py{.orig,} || true

  patch -Np1 -i ../pghost-unix-sock.patch
}

build() {
  cd pg8000-$pkgver
  python setup.py build
}

check() {
  cd pg8000-$pkgver
  # GSS tests: need custom pg_hba.conf, while pifpaf does not support it yet
  # SSL tests: need TCP connections [1][2], while pifpaf uses unix domain sockets
  # [1] https://github.com/postgres/postgres/blob/REL_13_1/src/backend/postmaster/postmaster.c#L2027
  # [2] https://www.postgresql.org/message-id/flat/200801041713.22341.peter_e%40gmx.net
  PYTHONPATH="$PWD" pifpaf run postgresql -- bash -c "
    psql -c \"CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD 'pw';\"
    psql -c \"create extension hstore;\"
    pytest test -k 'not testGss and not test_gss and not testSsl and not test_ssl'
  "
}

package() {
  cd pg8000-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
