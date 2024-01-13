# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python2-logbook
pkgver=1.5.3
pkgrel=3
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('i686' 'x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD')
depends=('python2-six' 'openssl-1.1')
makedepends=('python2-setuptools' 'cython2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitsuhiko/logbook/archive/$pkgver.tar.gz"
        "$pkgname-sqlalchemy-1.4.patch::https://github.com/getlogbook/logbook/pull/316.patch"
        "python-logbook-1.5.3-reproducibility.patch::https://github.com/getlogbook/logbook/commit/7b51f1adbdfd71180b8da9b1462552db32350b1d.patch")
sha512sums=('c9068324f12a189ced98e2c02753489847fa533ce3a3af07b62c73e9959c2e014d47515d47e756d031639cb220a2c4a9a380cba4cb3ea1b190c50106decba686'
            'ea19ceb3b207947d63c9c5e48ac7b2ba20e3762c4ffc4cfa909e90ef3fc58fc348090c312b79bcaa4f19bae0c1da63a8128b5593412b88c2b654c3afc361a4ea'
            'd1bd363531266cece00f56d660ed1310756d9df64a6b1af36a1c4f1e945e54e3ef22a6854b304de7d65e79008f0dee182ea4d904d8ecfff087b1855f9d4a5cc4')

prepare() {
  cd "$srcdir"/logbook-$pkgver
  patch -Np1 -i ../$pkgname-sqlalchemy-1.4.patch
  # Make ordering of requires.txt reproducible (https://github.com/getlogbook/logbook/pull/313)
  patch -Np1 -i "$srcdir/python-logbook-1.5.3-reproducibility.patch"
}

build() {
  cd "$srcdir"/logbook-$pkgver
  cython2 logbook/_speedups.pyx
  python2 setup.py build
}

package() {
  cd logbook-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm664 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
