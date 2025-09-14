# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-mcu-link
_name=${pkgname#python-}
pkgver=0.6.6
pkgrel=7
pkgdesc="SPSDK MCU-Link. A debugger probe plugin for SPSDK supporting LPC-Link/MCU-Link from NXP."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-hid
  python-pyusb
  # AUR
  python-spsdk
  python-libusb-package
  python-wasmtime
  pyinstaller
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  python-pytest
  python-click
)
optdepends=(
  'stlink: for stlink device detection via udev'
)
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/spsdk-mcu-link/spsdk_mcu_link-${pkgver}.tar.gz")
sha512sums=('4b1892bc98339f306a0ffaefb1382a0d0348dd837c9f086f5fe5cfc82bdd2fb39458263bf0a27d4c7be08355fee19bff19a3161011673d6e7fa5120965c88f84')
_name=${_name//-/_}

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

_check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # breaks due to changes in test facilities in Python 3.12
    --deselect test/unit/test_autoflush.py::TestAutoflush::test_transfer_err_not_flushed
  )

  cd ${srcdir}/$_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
