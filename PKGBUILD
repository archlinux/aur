# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=('python2-psutil-kilo')
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A cross-platform process and system utilities module for Python2'
url='http://code.google.com/p/psutil/'
license=('custom: BSD')
makedepends=('python2' 'python2-setuptools')
checkdepends=('net-tools' 'procps-ng')
depends=('glibc' 'python2')
source=("https://pypi.python.org/packages/source/p/psutil/psutil-$pkgver.tar.gz")
md5sums=('80c3b251389771ab472e554e6c729c36')

build() {
  cd psutil-$pkgver

  msg2 python2
  python2 setup.py build --build-lib=build/python2
  find build/python2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

check() {
  cd psutil-$pkgver

  msg2 python2
  export PYTHONPATH="$PWD/build/python2"
  #python2 test/test_psutil.py
  python2 test/test_memory_leaks.py
}

package() {
  cd psutil-$pkgver
  python2 setup.py build --build-lib=build/python2 \
                   install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
