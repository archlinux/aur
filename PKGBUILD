# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgbase=python-tarantool
pkgname=(python-tarantool python2-tarantool)
pkgver=0.6.6.r25.gb267643
_commit=b267643a242e2e6abc013539395b89dd235b798f
pkgrel=2
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-msgpack' 'python2-msgpack'
             'python-yaml' 'python2-yaml' 'python-six' 'python2-six' 'git')
checkdepends=('tarantool')
#source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
source=("git+https://github.com/tarantool/tarantool-python#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd tarantool-$pkgver
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv tarantool-python tarantool-$pkgver
  sed -i 's/msgpack-python/msgpack/g' tarantool-$pkgver/setup.py
  cp -a tarantool-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tarantool-$pkgver
  python setup.py build

  cd "$srcdir"/tarantool-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/tarantool-$pkgver
  python setup.py test

  cd "$srcdir"/tarantool-$pkgver-py2
  python2 setup.py test
}

package_python-tarantool() {
  depends=('python' 'python-msgpack' 'python-yaml' 'python-six')

  cd tarantool-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-tarantool() {
  depends=('python2' 'python2-msgpack' 'python2-yaml' 'python2-six')

  cd tarantool-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
