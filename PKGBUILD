# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-mcu-link
_name=${pkgname#python-}
pkgver=0.6.5
pkgrel=1
pkgdesc="SPSDK MCU-Link. A debugger probe plugin for SPSDK supporting LPC-Link/MCU-Link from NXP."
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  python-pyusb
  # AUR
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
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/s/spsdk-mcu-link/spsdk_mcu_link-${pkgver}.tar.gz")
sha512sums=('d518cadc804d339a622e062810d8f216019b851b2288af1e28ecbbe4c4f075de5c5d2609c3105195cdc07fc5007a3cc84579193a8055f9e3995717e843d4b3fd')
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
