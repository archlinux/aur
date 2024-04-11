# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyOCD
pkgname=python-pyocd
pkgver=0.36.0
pkgrel=2
pkgdesc="Programming and debugging Arm Cortex-M microcontrollers"
arch=(any)
url="https://github.com/pyocd/pyOCD"
license=(Apache-2.0)
depends=(
  python
  python-capstone
  python-cmsis-pack-manager
  python-colorama
  python-importlib-metadata
  python-importlib-resources
  python-intelhex
  python-intervaltree
  python-lark
  python-natsort
  python-prettytable
  python-pyelftools
  python-pylink-square
  python-pyusb
  python-pyyaml
  python-six
  python-typing_extensions
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
)
optdepends=(
  'python-setuptools: for plugin support'
  'stlink: for stlink device detection via udev'
)
provides=(pyocd)
conflicts=(pyocd)
replaces=(pyocd)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-0.36.0-optional_libusb_package.patch
)
sha512sums=('26efd6ceeb0ddaea9ac52170082b9fd87926790f90c0d7ccb1deb9e9ec549b84202801704b65641e6a2ac7fe0215a540e45eb0e1a0b9a38ac373720c5884bd36'
            'c4aadf654260a3d0a21eb937b211c6790de7eb255fa4ec60133b48d34179692706c6c5500019c95d3664076cf39e1451f40e7d468d8231f749a2b24f11aa8c5b')
b2sums=('14dac4f5ae3b5fe218557af08a9e284882436a0ebfe16487b59cd0df7a051e0dc1fb515b940ecb66ed0be5cb0c03e02a87834883597e7d8d4fa99e76da60c137'
        '9871afe976a9ccad60dd71ae8cc28f47178a0848aad9e61d315df92d554a69c0e3e140bdc7390da462e2f138ba8d8584e855bab9c197c8431ff1c77b6ea8156b')

prepare() {
  cd $_name-$pkgver

  # we remove the dependency for libusb-package, because it would vendor libusb
  # https://github.com/pyocd/pyOCD/issues/1331
  sed '/libusb-package/d' -i setup.cfg
  patch -Np1 -i ../$pkgname-0.36.0-optional_libusb_package.patch

  # remove udev rules for stlink devices (the stlink package provides them):
  rm -v udev/*stlink*.rules

  # tag devices with uaccess to automatically make them available to active user sessions
  sed -e 's|MODE:="666"|MODE:="0660", TAG+="uaccess"|g' -i udev/*.rules
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # breaks due to changes in test facilities in Python 3.12
    --deselect test/unit/test_autoflush.py::TestAutoflush::test_transfer_err_not_flushed
  )

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 udev/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
