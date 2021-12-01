# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-alt-pytest-asyncio
pkgver=0.5.4
pkgrel=2
pkgdesc='Alternative pytest plugin to pytest-asyncio'
arch=('any')
license=('MIT')
url='https://github.com/delfick/alt-pytest-asyncio'
depends=('python-pytest')
makedepends=('python-setuptools')
checkdepends=('python-noseofyeti' 'python-nest-asyncio')
source=("https://github.com/delfick/alt-pytest-asyncio/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2078e053e93b926fa847e8cb7db4c23a9f47b2135f7ce5ff5883602ba8e1689f01b486ce566776c07aa680ef5f38a3d746a34f338b8e11bf18ceec78e942431d')

build() {
  cd alt-pytest-asyncio-release-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd alt-pytest-asyncio-release-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  # https://github.com/delfick/alt-pytest-asyncio/issues/5
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" pytest \
    --deselect tests/test_examples.py::test_shows_correctly_for_failing_fixtures[example_timeouts] \
    --deselect tests/test_examples.py::test_shows_correctly_for_failing_fixtures[example_fixture_failures]
}

package() {
  cd alt-pytest-asyncio-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
