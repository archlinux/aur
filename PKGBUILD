# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=python-billiard
pkgname=('python-billiard' 'python2-billiard')
pkgver=3.3.0.18
pkgrel=2
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/billiard"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose-cover3' 'python2-nose-cover3' 'python-mock' 'python2-mock')
source=("https://pypi.python.org/packages/source/b/billiard/billiard-${pkgver}.tar.gz")
md5sums=('96700d11cb4b9d33960eb8e9b55c08c6')

prepare() {
  cp -a billiard-$pkgver{,-py2}
}

build() {
  cd "$srcdir/billiard-$pkgver"
  python setup.py build

  cd "$srcdir/billiard-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/billiard-$pkgver"
  nosetests3

  cd "$srcdir/billiard-$pkgver-py2"
  nosetests2
}

package_python-billiard() {
  depends=('python')

  cd "$srcdir/billiard-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir/billiard-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Avoid conflicts
  mv "$pkgdir"/usr/lib/python3.4/site-packages/{funtests,billiard/}
}

package_python2-billiard() {
  depends=('python2')

  cd "$srcdir/billiard-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir/billiard-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Avoid conflicts
  mv "$pkgdir"/usr/lib/python2.7/site-packages/{funtests,billiard/}
}
