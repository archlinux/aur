# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >
pkgname=python2-click-plugins
_name=${pkgname#python2-}
pkgver=1.1.1
pkgrel=5
pkgdesc='Register click CLI commands via setuptools entry-points (Python 2)'
arch=('any')
url='https://github.com/click-contrib/click-plugins'
license=('BSD')
depends=('python2-click')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest')
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('46ab999744a9d831159c3411bb0c79346d94a444df9a3a3742e9ed63645f264b')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Get rid from the unicode icon, which breaks click's formatter
  sed -i 's/icon = /&"[Oops]"  # /' click_plugins/core.py
  sed -i /u2020/d tests/test_plugins.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m pytest -W ignore::DeprecationWarning
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
