# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase=python-nose
pkgname=('python-nose' 'python2-nose' 'python-nose-doc')
pkgver=1.3.7
pkgrel=4
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='http://readthedocs.org/docs/nose/'
license=('LGPL2.1')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools' 'python2-sphinx')
source=("https://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz")
sha512sums=('e65c914f621f8da06b9ab11a0ff2763d6e29b82ce2aaed56da0e3773dc899d9deb1f20015789d44c65a5dad7214520f5b659b3f8d7695fb207ad3f78e5cf1b62')

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  cp -R "$srcdir/nose-$pkgver" "$srcdir/nose2-$pkgver"
}

package_python-nose() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/nose-$pkgver"
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
  ln -s nosetests "$pkgdir/usr/bin/nosetests3"
}

package_python2-nose() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/nose2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  mv "$pkgdir/usr/bin/nosetests" "$pkgdir/usr/bin/nosetests2"
  rm -rf "$pkgdir/usr/share"
}

package_python-nose-doc(){
  pkgdesc="Nose documentation and examples"
  cd "$srcdir/nose-$pkgver/doc"
  make SPHINXBUILD=sphinx-build2 html
  mkdir -p "$pkgdir/usr/share/doc/python-nose"
  cp -r .build/html "$pkgdir/usr/share/doc/python-nose"
  cp -r ../examples "$pkgdir/usr/share/doc/python-nose"
}
