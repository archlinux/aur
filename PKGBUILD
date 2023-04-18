# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.4.1
pkgrel=2
pkgdesc="A custom pyton codec that provides an RSpec style dsl for python"
url="https://github.com/delfick/nose-of-yeti"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-asynctest' 'python-pytest' 'python-alt-pytest-asyncio'
              'python-pytest-helpers-namespace')
source=("https://github.com/delfick/nose-of-yeti/archive/release-$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-python-3.11.patch::https://github.com/delfick/nose-of-yeti/commit/29f32257f4e8e11fdcd66bebc5f63197124b2957.patch)
sha512sums=('93c46ba446e60e4d014569048a275bda944d8cd014ced12b3f60527f916cde040d4cb40122802563ae45fb9d7b5b0209f09e1734235c0fe3d7e8cca3256228d6'
            '34bad155619c857263216b190a90cdcb79ddc412d040656ecc20224ea1c9581b97fda40c7bd3da7118f4e14b44a6a92c83095400e870e84c8100ea6002c1ad36')

prepare() {
  cd nose-of-yeti-release-$pkgver
  patch -p1 -i ../$pkgname-python-3.11.patch
}

build() {
  cd nose-of-yeti-release-$pkgver
  python setup.py build
}

check() {
  cd nose-of-yeti-release-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python setup.py install
  test-env/bin/python -m pytest
}

package() {
  cd nose-of-yeti-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
