# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyOCD
pkgname=python-pyocd
pkgver=0.37.0
pkgrel=1
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
)
sha512sums=('dfebd7a916729104cdc7cc6f7b263fe46c4e94dbb3cdee9bccd031c5e25a150ee5b8c4fcb73041d203f77eb2e9eca37cdac6309128ae861dc109e96f0f191ec9')

prepare() {
  cd $_name-$pkgver

  # we remove the dependency for libusb-package, because it would vendor libusb
  # https://github.com/pyocd/pyOCD/issues/1331
 #  sed '/libusb-package/d' -i setup.cfg
 #  patch -Np1 -i ../$pkgname-0.36.0-optional_libusb_package.patch

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
