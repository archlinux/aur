# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-pyocd
_name=${pkgname#python-}
pkgver=0.3.12
pkgrel=1
pkgdesc="PyOCD SW Debugger. A debugger probe plugin for SPSDK."
arch=(any)
url="https://pypi.org/project/spsdk-pyocd"
license=(BSD-3-Clause)
depends=(
  python
  python-importlib-metadata
  # AUR
  python-spsdk
  python-pyocd
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('8111edea63ac59a4c2e2f1afb7aa8520dcb9879ceb1380de435896fb14d942dcdd99ab11637d1cdefed0467175840038ceac784f74c7c7c5497b63abdc919529')
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
