# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.6.0
pkgrel=2
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('python-setuptools')
checkdepends=('python-noseofyeti' 'python-nest-asyncio')
source=("https://github.com/delfick/alt-pytest-asyncio/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1e93fd6a14bdff4f9ec3efa2300093cf235d911d47c198b52ebf3038ddde738e5f4083909c815438b3b9a7eefc301fe0d6acf56d95ef0e7c9e68a3e61016e233')

prepare() {
  cd alt-pytest-asyncio-release-$pkgver
  # https://github.com/delfick/alt-pytest-asyncio/issues/12
  sed -i -e 's/from _pytest.pytester import Testdir as TD, LineMatcher/from _pytest.legacypath import Testdir as TD\nfrom _pytest.pytester import LineMatcher, MonkeyPatch/' -e 's/TD(request, factory)/TD(request, factory, MonkeyPatch())/' tests/test_examples.py
}

build() {
  cd alt-pytest-asyncio-release-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd alt-pytest-asyncio-release-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest --deselect tests/test_examples.py
}

package() {
  cd alt-pytest-asyncio-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
