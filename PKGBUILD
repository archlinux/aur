# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgbase=pygraphviz
pkgname=('python-pygraphviz' 'python2-pygraphviz')
pkgver=1.3.1
pkgrel=1
pkgdesc='PyGraphviz is a Python interface to the Graphviz graph layout and visualization package.'
arch=('i686' 'x86_64')
license=('LGPL')
url="https://networkx.lanl.gov/pygraphviz"

source=(http://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz)
md5sums=('7f690295dfe77edaa9e552d09d98d279')

prepare() {
    cp -a "$pkgbase-$pkgver" "python2-$pkgbase-$pkgver"
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py build

  cd "$srcdir/python2-$pkgbase-$pkgver"
  python2 setup.py build
}

package_python-pygraphviz() {
  depends=('python3' 'graphviz')

  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  mv "$pkgdir/usr/share/doc/$pkgbase-$pkgver" "$pkgdir/usr/share/doc/python-pygraphviz"
}

package_python2-pygraphviz() {
  depends=('python2' 'graphviz')

  cd "$srcdir/python2-$pkgbase-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  mv "$pkgdir/usr/share/doc/$pkgbase-$pkgver" "$pkgdir/usr/share/doc/python2-pygraphviz"

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;
}
