# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.4.8
_commit=5bd8abafa5e8db32e7fff37105d2ac25d30605bf
pkgrel=1
pkgdesc="A custom pyton codec that provides an RSpec style dsl for python"
url="https://github.com/delfick/nose-of-yeti"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-alt-pytest-asyncio'
              'python-pytest-helpers-namespace')
source=("git+https://github.com/delfick/nose-of-yeti.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd nose-of-yeti
  # https://github.com/delfick/nose-of-yeti/issues/22
  sed -i '/asynctest/d' pyproject.toml
  python -m build -nw
}

check() {
  cd nose-of-yeti
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd nose-of-yeti
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
