# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-projectq
pkgver=0.5.0
pkgrel=3
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
sha512sums=('2760f75e8adbe788de33ac84f7194cf438c6353ec754dab237a104e98c0b45ee8548f8d2f83a9c68f3e9e1ec82ddd29faeab68d6b71672aa9383f7331969efa5')

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
