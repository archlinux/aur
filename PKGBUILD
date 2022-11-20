# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-aspectlib
pkgver=1.5.2
pkgrel=4
pkgdesc="Development library for quickly writing configurable applications and daemons"
arch=('any')
license=('BSD')
url="https://github.com/ionelmc/python-aspectlib"
depends=('python38-fields')
makedepends=('python38-setuptools')
checkdepends=('python38-tornado' 'python38-process-tests'
              'python38-profilestats' 'python38-pytest-runner') # 'mysql-python38')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionelmc/python-aspectlib/archive/v$pkgver.tar.gz"
        'python310.patch::https://raw.githubusercontent.com/archlinux/svntogit-community/master/python-aspectlib/trunk/python310.patch')
sha512sums=('33642f828989d07c6af78bdf9adc9f2abbc419df89b878cfe7bd9c8df226a59401176b56b1f2b3ba48661ea5a145520de0bc7a0980226b742b0a79f31ab7dd7f'
            '74b4261afd1fe20749f94dab067514eab12c484453607b820a96e1e8308fddbac4ac49ce24334c79c9fea6729877457ae60cb5004709106186c51d9af66087af')

prepare() {
  cd python-aspectlib-$pkgver
  # https://github.com/ionelmc/python-aspectlib/pull/22
  # patch -Np1 -i ../python310.patch
}

build() {
  cd python-aspectlib-$pkgver
  python3.8 setup.py build
}

check() {
  cd python-aspectlib-$pkgver
  # https://github.com/ionelmc/python-aspectlib/issues/15
  python3.8 setup.py pytest --addopts '--deselect tests/test_integrations_py3.py::test_decorate_tornado_coroutine'
}

package() {
  cd python-aspectlib-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
