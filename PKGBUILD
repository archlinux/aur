# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=edalize
pkgname=python-$_pkgname
pkgver=0.2.5
pkgrel=3
pkgdesc='An abstraction library for interfacing EDA tools'
arch=('any')
url='https://github.com/olofk/edalize'
license=('BSD')
depends=('python' 'python-jinja')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-pandas' 'iverilog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        $pkgname-pandas-1.3.patch::https://github.com/olofk/edalize/commit/f4b3cc5bccf0.patch)
sha512sums=('72234a7e743acc82a8ebe22d3d71b4ba26d2773556ce5af88d683c488ba3583ed6d89bf2d6f2fb1faf5b9d712e3056033878178ae30632750afe2a9e6a722392'
            '357b91220b8a5edd26e3e93b0108d98f648b663ee84776b07a25cac75f48f52cb9745ba775660a4921e267558e1e2632d1a539f0d9eeeea1e97df5fea1d78d69')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../$pkgname-pandas-1.3.patch

  rm tests/test_spyglass.py

  sed -i '/pytest/d' setup.py
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=. pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
