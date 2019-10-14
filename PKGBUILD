# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Melissa Padilla <mpadilla2 at hotmail dot com>

pkgbase=python-future
pkgname=(python-future python2-future)
pkgver=0.18.0
pkgrel=1
pkgdesc="Clean single-source support for Python 3 and 2"
url="https://python-future.org/"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-requests' 'python2-requests')
options=('!emptydirs')
source=("https://pypi.io/packages/source/f/future/future-$pkgver.tar.gz")
sha512sums=('c2bf1741d548d007f25dd77e12899cca6167b627815a8b1963efe2df69ef35c3c05a774ada74d104b3ed7c976a53e270035e84fcd980fd57fe3c597c571af46f')

prepare() {
  cp -a future-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/future-$pkgver
  python setup.py build

  cd "$srcdir"/future-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/future-$pkgver
#PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python setup.py test || warning "Tests failed"

  cd "$srcdir"/future-$pkgver-py2
#PYTHONPATH="$PWD/build/lib:$PYTHONPATH" python2 setup.py test
}

package_python-future() {
  depends=('python')
  optdepends=('python-setuptools: futurize and pasteurize scripts')
  provides=('futurize' 'pasteurize')

  cd future-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-future() {
  depends=('python2')
  optdepends=('python2-setuptools: futurize2 and pasteurize2 scripts')

  cd future-$pkgver-py2

  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/futurize{,2}
  mv "$pkgdir"/usr/bin/pasteurize{,2}

  install -D -m644 LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
