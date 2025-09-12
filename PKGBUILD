# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-spsdk-pyocd
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=0
pkgdesc="PyOCD SW Debugger. A debugger probe plugin for SPSDK."
arch=(any)
url="https://pypi.org/project/spsdk-pyocd"
_name=${_name//-/_}
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
  jq
  curl
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
_real_url=$(curl -s "https://pypi.org/pypi/${_name//_/-}/${pkgver}/json" | jq -r '.urls[] | select(.packagetype == "sdist") | .url')
source=("${_name}-${pkgver}.tar.gz::${_real_url}")
sha512sums=('d4a49989ecb5ff46ded385a71546bb13df13721f67981adbcaf372f68a7bf10a089985c6a5b5e0cd9761d850fe40c7e5232ebc6e11a1ff6afd96b9be2cc952e0')

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
