# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-option-group
pkgname=python-click-option-group
pkgver=0.5.4
pkgrel=1
pkgdesc="Option groups missing in Click"
arch=(any)
url="https://github.com/click-contrib/click-option-group"
license=(BSD)
depends=(python-click)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
# no tests in sdist tarball: https://github.com/click-contrib/click-option-group/issues/39
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=($_name-$pkgver.tar.gz::https://github.com/click-contrib/click-option-group/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6f7e5c1fb10ef50980a05c08938bf2d04fc3d31077da465e1b0a8de4f6b2af13d5ca7d99b4edff0756d62a5e7abcb2165a8104899c89fcfb98282324bca22766')
b2sums=('78aab9f41b14047cca42ad36173685783e59d8b7dcdb9d0a1527ba0aef9ca59dd0623c295862164277ad07e67af211d44a1c24b675fb64ec52b2c71e950e7a3c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
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
