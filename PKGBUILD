# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.5.0
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
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)
source=(https://github.com/ProjectQ-Framework/ProjectQ/archive/v$pkgver.tar.gz)
sha512sums=('63264d69c89d327ff451786d35719d0500ecc0ca1cb0c93e3a8f6d0c17674f9f68412feccf0f4c2876f8202c0d89ebd9af290d3405361473f4e99afc14ac8b41')

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
