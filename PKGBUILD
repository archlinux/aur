# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=1.0.10
pkgrel=1
pkgdesc='Pytest plugin that allows multiple failures per test'
arch=('any')
url='https://github.com/okken/pytest-check'
license=('MIT')
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-flit-core'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('dc3a80b20637eab8adda085ca8172bc3bde75bd47566972a07cf226bb38771933a531d99e139d7c220cc149715fd7d98ab964f72e0b520e8dd3df7633a6e5a90')
b2sums=('e51dbb2806bdac73e202b14668c76675979113f661eb339a1a3cff07069d3d4709869d67ea2cb6384483ebde8b68288026df9b7492b17ea67c79ee95e6865809')

prepare() {
  cd "$_pkgname-$pkgver"

  # remove flit-core version constraint
  sed \
    -i pyproject.toml \
    -e 's/,<3//'
}

build() {
  cd "$_pkgname-$pkgver"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
