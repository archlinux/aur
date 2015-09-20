# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgbase=python-future
pkgname=(python-future python2-future)
pkgver=0.15.2
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="http://python-future.org/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/f/future/future-$pkgver.tar.gz"
        '0001-Remove-duplicate-assertion-in-builtins-tests.patch'
        'remove-two-expected-failure-decorators.patch')
md5sums=('a68eb3c90b3b76714c5ceb8c09ea3a06'
         '0477272fe6697644053a2eb33f9f41a8'
         'c09987e5fbee6e7520cc9f696c37dbb1')
sha256sums=('3d3b193f20ca62ba7d8782589922878820d0a023b885882deec830adbf639b97'
            'b9be3ad81abece44b92f4ac3b931a8e2c42773f4addb8ddfb96b0783ec1335c2'
            'cd1f918482951c6f437dc356eb87c8325e6ac34c6a9dd3af9fe546ea21bfc8fa')

prepare() {
  # https://github.com/PythonCharmers/python-future/pull/168
  patch -d future-$pkgver -Np1 <0001-Remove-duplicate-assertion-in-builtins-tests.patch

  cp -a future-$pkgver{,-py2}

  # Drop expected failure decorators from two tests that succeed on Python 3.5
  patch -d future-$pkgver -Np1 <remove-two-expected-failure-decorators.patch
}

build() {
  cd "$srcdir/future-$pkgver"
  python setup.py build

  cd "$srcdir/future-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/future-${pkgver}"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python setup.py test

  cd "$srcdir/future-${pkgver}-py2"
  PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python2 setup.py test
}

package_python-future() {
  depends=('python')
  optdepends=('python-setuptools: futurize and pasteurize scripts')
  provides=('futurize' 'pasteurize')

  cd "$srcdir/future-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-future() {
  depends=('python2')
  optdepends=('python2-setuptools: futurize2 and pasteurize2 scripts')

  cd "$srcdir/future-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir/usr/bin/futurize"{,2}
  mv "$pkgdir/usr/bin/pasteurize"{,2}

  install -D -m644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
