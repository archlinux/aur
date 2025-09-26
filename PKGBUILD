# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=3.3.0
pkgrel=1
pkgdesc="Open Source Secure Provisioning SDK for NXP MCU/MPU"
arch=(any)
url="https://github.com/nxp-mcuxpresso/spsdk"
license=(BSD-3-Clause)
depends=(
  ipython
  python
  python-asn1crypto
  python-astunparse
  python-bitstring
  python-can
  python-click
  python-click-command-tree
  python-colorama
  python-crcmod
  python-cryptography
  python-fastjsonschema
  python-filelock
  python-hexdump
  python-importlib-metadata
  python-ipywidgets
  python-setuptools-scm
  python-packaging
  python-platformdirs
  python-prettytable
  python-pyasn1
  python-pyserial
  python-requests
  python-ruamel-yaml
  python-typing_extensions
  python-yaml
  # AUR
  python-bincopy
  python-click-option-group
  python-deepmerge
  python-ftd2xx
  python-pyftdi
  python-pylibftdi
  python-gmssl
  python-libuuu
  python-sly
  python-spsdk-pqc
  python-libusbsio
  #   python-spsdk-mcu-link
  #   python-spsdk-pyocd
  python-x690
)
makedepends=(
  python-tomli
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-voluptuous
)
optdepends=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b27f6fc3afad8b42b91bf60d71b4b957a49cea1179f2f12940927b827f18dac63e462c5123e26d014d6f359bd2323908211304a7ef8a208824039a7f1eb73259')

prepare() {
  cd $_name-$pkgver
  # remove all version pinning and overly explicit version bounds
  # https://github.com/NXPmicro/spsdk/issues/35
  sed -e 's|>=.*||g;s|==.*||g;s|~=.*||g;s|<.*||g' -i requirements{,-develop}.txt
  sed -E 's/(requires = \[.*"setuptools_scm)[^"]*(".*"setuptools)[^"]*(".*"wheel")/\1\2\3/' -i pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
