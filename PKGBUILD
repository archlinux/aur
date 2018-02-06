# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Clément DEMOULINS <clement@archivel.fr>
pkgbase=pygraphviz
pkgname=('python-pygraphviz' 'python2-pygraphviz')
pkgver=1.4rc1
pkgrel=1
pkgdesc='Python interface to the Graphviz graph layout and visualization package'
makedepends=('python3' 'python2' 'graphviz' 'python-setuptools' 'python2-setuptools')
arch=('i686' 'x86_64')
license=('LGPL')
url="https://networkx.lanl.gov/pygraphviz"
source=("https://github.com/$pkgbase/$pkgbase/archive/$pkgbase-$pkgver.tar.gz")
sha256sums=('e6a9b25dc75f1214acdff1ef82bc48c75e55be6c4db3a449abbb5fcea8ec2cf5')

prepare() {
    cp -a "$pkgbase-$pkgbase-$pkgver" "python2-$pkgbase-$pkgver"
}

build() {
    cd "$pkgbase-$pkgbase-$pkgver"
    python setup.py build

    cd ../"python2-$pkgbase-$pkgver"
    python2 setup.py build
}

package_python-pygraphviz() {
    depends=('python3' 'graphviz')

    cd "$pkgbase-$pkgbase-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 \
        --include-path /usr/include/graphviz \
        --library-path /usr/lib/graphviz
    mv "$pkgdir/usr/share/doc/$pkgbase-$pkgver" "$pkgdir/usr/share/doc/python-pygraphviz"
}

package_python2-pygraphviz() {
    depends=('python2' 'graphviz')

    cd "python2-$pkgbase-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 \
        --include-path /usr/include/graphviz \
        --library-path /usr/lib/graphviz
    mv "$pkgdir/usr/share/doc/$pkgbase-$pkgver" "$pkgdir/usr/share/doc/python2-pygraphviz"

    # Patch to use python2
    find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
        sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
        -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;
}
