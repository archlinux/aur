# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-lsp-mypy
_name=pylsp-mypy
pkgver=0.5.6
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/Richardk2n/pylsp-mypy"
license=('MIT')
depends=(python-lsp-server mypy
  # https://bugs.archlinux.org/task/73090
  python-tomli
)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f2a4324ee3d464942537005b63f1b2d54edb74e826deb83c5dac27938e7eb4c6')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  # https://github.com/Richardk2n/pylsp-mypy/commit/788c75af60998c922ff5c69e879a688bc14967fb
  PYTHONPATH="$PWD" pytest --deselect=test/test_plugin.py::test_multiple_workspaces
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
