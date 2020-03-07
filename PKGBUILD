# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=(python-boto python2-boto)
pkgver=2.49.0.20190327
_commit=9e1cd3bd76e738d80630f1bd9160fd87c8eab865
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'python-requests'
              'python2-requests' 'python-httpretty' 'python2-httpretty')
source=("$pkgbase-$_commit.tar.gz::https://github.com/boto/boto/archive/$_commit.tar.gz"
         boto-python-3.8.patch)
sha512sums=('a68b7560caef3328970b9d1febc77fb28e537e4012b692b492d69428aca7deccf539e883cba4975497059ccdc56452f6e46f4a101b6e93f007667fe45c842e24'
            '3e32db201adb637d3b6041f9e7be65889f1306042cbed36e4884207cbf772dc8f7691be9a505ec79f111b99c8313e0d42436c1f9a2dfa095de6cc77a7fe4bc6d')

prepare() {
  mv boto-{$_commit,$pkgver}
  (cd boto-$pkgver
   patch -p1 -i ../boto-python-3.8.patch # Fix escaping with python 3.8
  )

  cp -a boto-$pkgver{,-py2}

  cd boto-$pkgver-py2
  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

check() {
  cd "$srcdir"/boto-$pkgver
  python tests/test.py default

  cd "$srcdir"/boto-$pkgver-py2
  python2 tests/test.py default
}

package_python-boto() {
  depends=('python')

  cd boto-$pkgver

  python setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Remove (somewhat deprecated) tools that conflicts with the python 2 version.
  rm -r "$pkgdir"/usr/bin
}

package_python2-boto() {
  depends=('python2')
  conflicts=('python-boto<2.32.1-1')
  replaces=('python-boto<2.32.1-1')

  cd boto-$pkgver-py2

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
