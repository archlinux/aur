# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.0.1
pkgrel=4
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-pytest-5.patch::https://github.com/h2non/pook/commit/2071da27701c82ce02b015e01e2aa6fd203e7bb5.patch)
sha512sums=('c1b3e6e84a04ad829afc6e1e45a9f7177cd8d4496680c4aaa4536613bd3d9c46eb09d7c531682257a50d52515d56482b4e479a33b3a2c60839efc2b2cfadfb0e'
            '2a292eacc6018543f7e9a58c86b9960c64f08e8fab961253696029d07778595b9cee175373592cb57620d526f8e74ca18336ca159077ab8bee55d2929dc987d3')

prepare() {
  cd pook-$pkgver
  patch -p1 -i ../$pkgname-pytest-5.patch
}

build() {
  cd pook-$pkgver
  python setup.py build
}

check() {
  cd pook-$pkgver
  pytest
}

package() {
  cd pook-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  rm -rf "$pkgdir"/usr/lib/python3.9/site-packages/tests
}
