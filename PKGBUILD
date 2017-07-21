# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-ioflo
pkgname=('python-ioflo' 'python2-ioflo')
pkgver=1.6.9
pkgrel=1
pkgdesc='Flo based programming interface in python'
arch=('any')
url='http://ioflo.com'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python2-enum34')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('e359ff07bd1bbeb11ad28f4b200d0454ef5cf3007095d97e8eafa40f5beb36170d952b6371503bfc1b56cd6480c7ab4aa1be313475ee080f7aae1a0d05d6ed06')

prepare() {
  cp -a ioflo-$pkgver{,-py2}

  sed -i '1i#coding: utf-8' ioflo-$pkgver-py2/ioflo/aid/vectoring.py
}

build() {
  cd "$srcdir"/ioflo-$pkgver
  python setup.py build

  cd "$srcdir"/ioflo-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ioflo-$pkgver
  python setup.py pytest

  cd "$srcdir"/ioflo-$pkgver-py2
  python2 setup.py pytest || warning "Tests failed"
}

package_python-ioflo() {
  depends=('python')

  cd ioflo-$pkgver
  python setup.py install --root="$pkgdir" -O1
}

package_python2-ioflo() {
  depends=('python2-enum34')

  cd ioflo-$pkgver-py2
  python2 setup.py install --root="$pkgdir" -O1

  mv "$pkgdir"/usr/bin/ioflo{,2}
}
