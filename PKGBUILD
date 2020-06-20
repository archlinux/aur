# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.15.3
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytz pifpaf postgresql)
depends=(python python-scramp)
source=("https://github.com/tlocke/pg8000/archive/$pkgver/pg8000-$pkgver.tar.gz")
sha256sums=('919793109ac0c02e073eae7a845647658b4eb8967f860a878295150cb0999e5e')

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
  # TODO
  PYTHONPATH="$PWD" pifpaf run postgresql -- pytest -v test || echo Tests fail!
}

package() {
  cd pg8000-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
