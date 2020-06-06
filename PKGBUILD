# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.5.1
pkgrel=1
pkgdesc='Open-source framework for quantum computing'
arch=('i686' 'x86_64')
url=https://projectq.ch
license=(Apache)
depends=(python
         python-numpy
         python-future
         python-pytest
         pybind11
         python-requests
         python-scipy
         python-networkx)
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme python-matplotlib)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=('832fd710e5097cf940f6125bc1e5b4f64a668a3ae53f522df2e970c4773f6b96b6c7711619aa3b9b2f190bea55d2687025889db97ee96a7af22fee777bcd4ade')

build() {
  cd "$srcdir"/ProjectQ-$pkgver/docs
  make html

  cd "$srcdir"/ProjectQ-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/ProjectQ-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp -r {docs/_build/html,examples} "$pkgdir"/usr/share/doc/$pkgname
  find "$pkgdir"/usr/share/doc/$pkgname/examples -type f -exec chmod 644 {} +
  install -Dm 644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm 644 NOTICE "$pkgdir"/usr/share/doc/$pkgname/NOTICE
}
