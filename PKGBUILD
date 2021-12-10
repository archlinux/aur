
pkgname=python2-docutils
_pkgname=docutils
# From the release notes: "Docutils 0.18.x is the last version supporting Python 2.7, 3.5, and 3.6."
pkgver=0.18.1
pkgrel=1
pkgdesc='Set of tools for processing plaintext docs into formats such as HTML, XML, or LaTeX (0.18.x is the last version supporting Python 2)'
arch=('any')
url='http://docutils.sourceforge.net'
license=('custom')
depends=('python2')
makedepends=('python2-setuptools')
install=python2-docutils.install
source=("https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('44404a6cc9d4c1e79c73a6ffee2898e459c9925ab9661e5d41394e13b3d861334cf0c5efcd18e87eb03041374e326cfd00539a6b2ec5979678889e8a536c9542')

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
