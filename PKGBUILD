# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-pytest-plugins
pkgname=('python-pytest-fixture-config' 'python2-pytest-fixture-config')
pkgver=1.2.11
pkgrel=1
arch=('any')
license=('BSD')
url='http://github.com/manahl/pytest-plugins'
makedepends=('python-pytest' 'python2-pytest' 'python-setuptools-git' 'python2-setuptools-git'
             'python-pypandoc' 'python2-pypandoc')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/manahl/pytest-plugins/archive/v$pkgver.tar.gz")
sha512sums=('89cf16b01fe4dd09d4aed2333d4848605f72dc3c8355c3586ebaadfbf0107d9de34ac510362d853ae07a4e533e5d8e062dea809088a346de0b669084d011a0bb')

prepare() {
  sed -i "s/'rst')/'rst', format='markdown')/" pytest-plugins-$pkgver/common_setup.py
  (cd pytest-plugins-$pkgver; make copyfiles)

  cp -a pytest-plugins-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pytest-plugins-$pkgver/pytest-fixture-config
  python setup.py build

  cd "$srcdir"/pytest-plugins-$pkgver-py2/pytest-fixture-config
  python2 setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/pytest-plugins-$pkgver/pytest-fixture-config
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.6/site-packages" py.test

  cd "$srcdir"/pytest-plugins-$pkgver-py2/pytest-fixture-config
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages" py.test2
}

package_python-pytest-fixture-config() {
  pkgdesc='Fixture configuration utils for py.test'
  depends=('python-pytest')

  cd pytest-plugins-$pkgver/pytest-fixture-config
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pytest-fixture-config() {
  pkgdesc='Fixture configuration utils for py.test'
  depends=('python2-pytest')

  cd pytest-plugins-$pkgver-py2/pytest-fixture-config
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
