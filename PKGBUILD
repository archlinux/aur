# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pylink-square
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
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
replaces=(pylink)
options=('!strip' '!debug')
# source=($pkgname-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  "0001-fix-import-mock.patch")
sha512sums=('a441ff9f380c24fce2fa9885867b9e8357d9d5b01656e06768f730c7d8366a47056314dbb769b0cdef752cb52ee6a4337756e9ffbbbd36486b66f9e1d5df9cda'
            'b61584eccd29d9087bf668377cd4220b0c45d00039b46bcfa1454b244a36eecaa3f5643f31adbc4c575ebe815fb119bbb92a4b926a918647bb03f0adbd49c64b')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ../*.patch
}

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
