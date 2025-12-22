# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyOCD
pkgname=python-pyocd
pkgver=0.42.0
pkgrel=5
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
  git
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
  $pkgname::git+$url.git#tag=v$pkgver
)
sha512sums=('a47ddc4de015a3af07bcbcaa539797d10cf9a63cc8382f265ff9dec48e214887a6ef9b4b88a2c9e51cf330087885384aea7414cbb449b0f18e6bc77899848b40')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"

  # remove udev rules for stlink devices (the stlink package provides them):
  rm -v udev/*stlink*.rules

  # tag devices with uaccess to automatically make them available to active user sessions
  sed -e 's|MODE:="666"|MODE:="0660", TAG+="uaccess"|g' -i udev/*.rules
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # breaks due to changes in test facilities in Python 3.12
    --deselect test/unit/test_autoflush.py::TestAutoflush::test_transfer_err_not_flushed
  )

  cd "${srcdir}/${pkgname}"
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 udev/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}
