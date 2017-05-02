# Maintainer: Clément DEMOULINS <clement@archivel.fr>

pkgbase=python2-pygraphviz
_realname=pygraphviz
pkgname=('python-pygraphviz' 'python2-pygraphviz')
pkgver=1.4rc1
pkgrel=1
pkgdesc='PyGraphviz is a Python interface to the Graphviz graph layout and visualization package.'
makedepends=('python3' 'python2' 'graphviz')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('LGPL')
url="https://networkx.lanl.gov/pygraphviz"

source=(https://github.com/${_realname}/${_realname}/archive/${_realname}-$pkgver.tar.gz)
md5sums=('308df30fd4dbd7708a3e750728541984')

prepare() {
    cp -a "${_realname}-${_realname}-$pkgver" "python2-${_realname}-$pkgver"
}

build() {
  cd "$srcdir/${_realname}-${_realname}-$pkgver"
  python setup.py build

  cd "$srcdir/python2-${_realname}-$pkgver"
  python2 setup.py build
}

package_python-pygraphviz() {
  depends=('python3' 'graphviz')

  cd "$srcdir/${_realname}-${_realname}-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --include-path /usr/include/graphviz --library-path /usr/lib/graphviz
  mv "$pkgdir/usr/share/doc/${_realname}-$pkgver" "$pkgdir/usr/share/doc/python-pygraphviz"
}

package_python2-pygraphviz() {
  depends=('python2' 'graphviz')

  cd "$srcdir/python2-${_realname}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --include-path /usr/include/graphviz --library-path /usr/lib/graphviz
  mv "$pkgdir/usr/share/doc/${_realname}-$pkgver" "$pkgdir/usr/share/doc/python2-pygraphviz"

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;
}
