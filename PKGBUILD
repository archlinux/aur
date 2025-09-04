# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=3
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
# url="https://github.com/Square/pylink"
url="https://pypi.org/project/${_name}"
_name=${_name//-/_}
license=(Apache-2.0)
depends=(
  python
  python-psutil
  python-six
  python-multiprocess
  # AUR
  jlink-software-and-documentation
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-tests
  python-pytest
  # AUR
  python-mock
  #   python-behave
)
conflicts=(${pkgname} pylink)
provides=(${pkgname} pylink)
replaces=(${pkgname} pylink)
options=('!strip' '!debug')
# source=($pkgname-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('cd4994326924f1f3e875af0d9af1cead5a016140b00d80262090965836eac6f6218fb8f04f82f0a3866e86cfc77e596993dc2413bba50362ac934fdb899470f5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # tests broken with Python 3.12: https://github.com/square/pylink/issues/197
    --deselect tests/unit/test_jlink.py::TestJLink::test_cp15_register_write_success
    --deselect tests/unit/test_jlink.py::TestJLink::test_jlink_restarted
    --deselect tests/unit/test_jlink.py::TestJLink::test_set_log_file_success
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
