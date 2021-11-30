
pkgname=python2-docutils
_pkgname=docutils
pkgver=0.17.1
pkgrel=1
pkgdesc='Set of tools for processing plaintext docs into formats such as HTML, XML, or LaTeX'
arch=('any')
url='http://docutils.sourceforge.net'
license=('custom')
depends=('python2')
makedepends=('python2-setuptools')
install=python2-docutils.install
source=("https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('5ec2087116bd5356fdffc54f07f6b0355aac5fa9d6caeefa77e8d201fd4706c0d419193c4d9a3964ae493da3091fe2c7dc36b74f81a1e1b9282173658b06e71b')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build --build-lib=build/python2
  find build/python2 -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

check() {
  cd $_pkgname-$pkgver
  # we need utf locale to valid utf8 tests
  export LANG=en_US.UTF-8
  PYTHONPATH="$PWD/build/python2/" python2 test/alltests.py
}

#package_python-docutils() {
#  depends=('python')#

#  cd $_pkgname-$pkgver
#  python setup.py build --build-lib=build/python \
#                  install --root="$pkgdir" --optimize=1
#  # symlink without .py
#  for f in "$pkgdir"/usr/bin/*.py; do
#      ln -s "$(basename $f)" "$pkgdir/usr/bin/$(basename $f .py)"
#  done
#  # setup license
#  install -D -m644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
#  install -D -m644 licenses/python* "$pkgdir/usr/share/licenses/$pkgname/"
#}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py build --build-lib=build/python2 \
                   install --root="$pkgdir" --optimize=1
  # fix python-docutils conflict
  for _f in "$pkgdir"/usr/bin/*.py; do
      mv -v "$_f" "${_f%.py}2.py"
  done
  # symlink without .py
  for _f in "$pkgdir"/usr/bin/*.py; do
      ln -s "$(basename $_f)" "$pkgdir/usr/bin/$(basename $_f .py)"
  done
  # setup license
  install -D -m644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
  install -D -m644 licenses/python* "$pkgdir/usr/share/licenses/$pkgname/"
}
