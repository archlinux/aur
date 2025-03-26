# Maintainer: getzze <getzze at gmail dor com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=click_option_group
pkgname=python-click-option-group
pkgver=0.5.7
pkgrel=2
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
sha512sums=('0e6c82b2b6a4a790c767ad775def93c3487e97990bbc172c95b6d90ccc366c8fb9dfe0fff4eecb64538218213c65642732eb1a0d421d2826e1f13689e6d5621a')
b2sums=('31357084654dc1011eeab64b0298fd5f5a5b417a4621dff7442b6dea02ffbe304d267adccb2f7adef8b7a005ad6055d5982b9e7b7990242fdf3a417c7c817040')

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
