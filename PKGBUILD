# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-prance
pkgname=(python-prance python2-prance)
pkgver=0.14.0
_openapi_commit=fbe62006211838a8bb7bf2433a1d15f1a5838a03
pkgrel=1
pkgdesc="Resolving Swagger/OpenAPI 2.0 and 3.0 Parser"
url="https://github.com/jfinkhaeuser/prance"
license=('custom:MITNFA')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet' 'python-yaml'
             'python2-yaml' 'python-flex' 'python2-flex' 'python-click' 'python2-click'
             'python-requests' 'python2-requests' 'python-six' 'python2-six'
             'python-semver' 'python2-semver')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pytest-cov' 'python2-pytest-cov')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jfinkhaeuser/prance/archive/v$pkgver.tar.gz"
        "OpenAPI-Specification-$_openapi_commit.tar.gz::https://github.com/OAI/OpenAPI-Specification/archive/$_openapi_commit.tar.gz")
sha512sums=('a9ff1e5f4a2de491c242542eb2abeeb4e58bbba9c58292cca3ac98e619f864b425beefe79290f371f79e33248cf76613f0abf0f691201628986f6074ad5e7c98'
            'd7957f1cdaa681b4c163e6e0b35ed6b808f469c3fdbba86a5e7221bb3c0c980415dca145e7f57bcebed75624562e89a893841d17c9e0ff82df4f0ff65ffaa2ae')

prepare() {
  rmdir prance-$pkgver/tests/OpenAPI-Specification
  ln -s "$srcdir"/OpenAPI-Specification-$_openapi_commit prance-$pkgver/tests/OpenAPI-Specification

  cp -a prance-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/prance-$pkgver
  python setup.py build

  cd "$srcdir"/prance-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/prance-$pkgver
  pytest

  cd "$srcdir"/prance-$pkgver-py2
  pytest2
}

package_python-prance() {
  depends=('python-chardet' 'python-yaml' 'python-flex' 'python-click' 'python-requests'
           'python-six' 'python-semver')

  cd prance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-prance() {
  depends=('python2-chardet' 'python2-yaml' 'python2-flex' 'python2-click' 'python2-requests'
           'python2-six' 'python2-semver')

  cd prance-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt

  mv "$pkgdir"/usr/bin/prance{,2}
}
