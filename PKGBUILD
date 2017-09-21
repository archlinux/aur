# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=python-acme
pkgname=('python-acme' 'python2-acme')
pkgver=0.18.2
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyopenssl' 'python2-pyopenssl'
             'python-pyrfc3339' 'python2-pyrfc3339' 'python-pytz' 'python2-pytz' 'python-requests'
             'python2-requests' 'python-six' 'python2-six' 'python-werkzeug' 'python2-werkzeug'
             'python-mock' 'python2-mock')
checkdepends=('python-nose' 'python2-nose')
source=("https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('7fb9d16c7b5bb9930b115c71c54ca586d8b4bbc6481219dd4b48279a81b94039fd1b89c3d3e96a66f3b39373a168e19d64f7910111c9ada243751cee04d839cd')

prepare() {
  sed -i "/'argparse',/d" acme-$pkgver/setup.py
  cp -a acme-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/acme-$pkgver
  python setup.py build

  cd "$srcdir"/acme-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/acme-$pkgver
  python setup.py nosetests

  cd "$srcdir"/acme-$pkgver-py2
  python2 setup.py nosetests
}

package_python-acme() {
  depends=('python-setuptools' 'python-pyopenssl' 'python-pyrfc3339' 'python-pytz' 'python-requests'
           'python-six' 'python-werkzeug' 'python-mock')

  cd acme-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-acme() {
  depends=('python2-setuptools' 'python2-pyopenssl' 'python2-pyrfc3339' 'python2-pytz'
           'python2-requests' 'python2-six' 'python2-werkzeug' 'python2-mock')

  cd acme-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/jws{,2}
}
