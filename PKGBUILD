# Maintainer: getzze <getzze at gmail dor com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=click_option_group
pkgname=python-click-option-group
pkgver=0.5.9
pkgrel=1
pkgdesc="Option groups missing in Click"
arch=(any)
url="https://github.com/click-contrib/click-option-group"
license=(BSD-3-Clause)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-hatch
  python-hatch-vcs
  python-wheel
)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('7c83a2460c08a3dc2ac129901acda2b19d828d54e7765fe03452648059d27ac98ce68b6ce703fd5c7876f85c6650b943f3e1ebbbe96c44590ed888dccd943314')
b2sums=('27c1547866ee696b8b822bc3de661c0d2209b2cc7febfdab7f8392616d46d2695b76d0cf4cbfb16482e1ac17c296ee4850d8f811bc721f8876b562afecbb62e3')

build() {
  cd $_name-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"

  pytest -vv
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
