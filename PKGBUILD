# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.7.1
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
  $pkgname-1.7.0-cryptography.patch
)
sha512sums=('2ee9be8b0ada9ba9525361aa6b0461a1468afabb7664c5b08b7bdbb559d7fc7f5b612a40bc46e1c2f36396795b9e62309f6e474cefff6bfe359e3805b8a39903'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560'
            '2c6d56add47e17342f19b281b206e1b658c651e46d17a64aef007774f093a40e25f81c604e0d9b3a24079f2179ea1f113736cdf44b286a0a01a4ad6b6cab00ce')
b2sums=('6b691a8d06d19f2581213484588a335a5e4cccd1310a277780b177a6c2e601a3c5312fe2eb0394c259a4f73669f18170dd18fdb612a02aed340523fbc271617f'
        '2c68116494b5e7ff51e59ec79dd3e354e2a8035ab35e29b27a097d7baa47e48c71a2cdac651920c76cd29097c5e8710e74106e41a4b3d5f543e259ef7404beac'
        'a1005b5408d67c8a5105068107c52f5a84f5c36e19a84d04e8456e67d0c4658961f11dedf4e5a5a00b6e91beddac49ebfea9d9f04c527b6b58bf47067224f2bd')

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

  # support python-cryptography >= 37
  # https://github.com/NXPmicro/spsdk/issues/43
  patch -Np1 -i ../$pkgname-1.7.0-cryptography.patch
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
