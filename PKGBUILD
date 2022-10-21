# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.8.0
pkgrel=1
pkgdesc="NXP Secure Provisioning SDK"
arch=(any)
url="https://github.com/NXPmicro/spsdk"
license=(BSD)
depends=(
  python-asn1crypto
  python-astunparse
  python-bincopy
  python-bitstring
  python-click
  python-click-command-tree
  python-click-option-group
  python-cmsis-pack-manager
  python-colorama
  python-commentjson
  python-crcmod
  python-cryptography
  python-deepmerge
  python-fastjsonschema
  python-hexdump
  python-jinja
  python-libusbsio
  python-oscrypto
  python-pycryptodome
  python-pylink-square
  python-pyocd
  python-pyserial
  python-ruamel-yaml
  python-sly
  python-typing-extensions
)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(
  python-jsonschema
  python-pytest
  python-voluptuous
  python-pyyaml
)
# pypi sdist tarball has no tests: https://github.com/NXPmicro/spsdk/issues/37
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=(
  $_name-$pkgver.tar.gz::https://github.com/NXPmicro/$_name/archive/refs/tags/$pkgver.tar.gz
  $pkgname-1.6.0-remove_pypemicro.patch
)
sha512sums=('ab6c404dae2994eec1a2016d7e187fc74fe3b6b50e8f431ca8003ccb5dbcefbdd55ecfa683062b94a85dee675da46483cc58e2c42b50afad83ebd60e22306108'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560')
b2sums=('0f8556e2b9f5e6401fcfb563017184eb8112f4f7ce5cb5c98831f5ba156189618bfe0bec74397ed0e77706bd1aea8342f64b8e8913918773e17170842a34237d'
        '2c68116494b5e7ff51e59ec79dd3e354e2a8035ab35e29b27a097d7baa47e48c71a2cdac651920c76cd29097c5e8710e74106e41a4b3d5f543e259ef7404beac')

prepare() {
  cd $_name-$pkgver
  # remove all version pinning and overly explicit version bounds
  # https://github.com/NXPmicro/spsdk/issues/35
  sed -e 's|>=.*||g;s|==.*||g;s|~=.*||g;s|<.*||g' -i requirements{,-develop}.txt
  # remove dependency on python-pypemicro as it vendors prebuilt shared libraries
  # https://github.com/NXPmicro/spsdk/issues/30
  # https://github.com/NXPmicro/pypemicro/issues/10
  sed '/pypemicro/d' -i requirements.txt
  patch -Np1 -i ../$pkgname-1.6.0-remove_pypemicro.patch
  # remove dependency on python-pyocd-pemicro as it vendors prebuilt shared libraries via python-pypemicro
  # https://github.com/pyocd/pyOCD/issues/1319
  # https://github.com/NXPmicro/spsdk/issues/30
  # https://github.com/NXPmicro/pypemicro/issues/10
  sed '/pyocd-pemicro/d' -i requirements.txt
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _deselected=()

  cd $_name-$pkgver
  # ignore failing tests due to incompatible bincopy: https://github.com/NXPmicro/spsdk/issues/38
  pytest -v --ignore tests/elftosb/test_elftosb_mbi.py -k "not test_parse_image_file_invalid and not test_load_binary_image"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
