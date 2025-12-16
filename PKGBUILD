# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyOCD
pkgname=python-pyocd
pkgver=0.42.0
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
  python-hidapi
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
sha512sums=('35722f3a7f7ae9a88bc9f7c90c1c1df6f3048b0d4b462c9b5bfe5e2136f330f51b6d2a52015122d0d1a39350aa42e698eb770167ceb412ece6967f48c4440ecd')

prepare() {
  cd $_name-$pkgver

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
