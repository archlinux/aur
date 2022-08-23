# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=1.0.7
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
sha512sums=('5cf5b25bc264475d475433f1418376c933335dbc7c765419cb00e6143a18d0ef560f027d472c21e2a339cee5111c487d7edd5b5cd149315e9d7cca956b928959')
b2sums=('ebcd8aed8ca20c67c9683a763da181981e0814bb10aaacd803f827610a3f33730655dfa684fc273b347a2542bc6c3f20e8253cc17d8a4bbe05c9938076784e4a')

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
