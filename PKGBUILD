# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.6.3
pkgrel=3
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
  $pkgname-1.6.3-click8.1.patch
  $pkgname-1.6.3-cryptography37.patch
)
sha512sums=('fe7b8ae82756b93ef90467617d9b3492c4d103bfcae2efbd6067208b1ea82c5e7cf599e5d56f1c25ff8850d61acf4068b04541df8763068562ff3f3438749ac3'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560'
            'bbeadf90867fc26bf2bb7cb5adc41fc7acfd7a577cf989525ca084da9863baebbb46aec17c57b1e5dd767d50d0e341cdf4552b820cb12122e6c5de250f48c538'
            'cbeb5d9b2dd9dd6af833a5eb20a0429296c699e22ac0fdc98c80fc80aca1d14e956424220c2223e721544a35d3010815b3ca227d571767be729f4c7a0a268300')
b2sums=('cbd58524ea291cfab21ad26c639e43058bd3e3db90ee70873919bf3a84b90e44eeb2d1fe72cd019dbb225a1fcd1118f5500ef462dc7284bc9df4e4f4995ff641'
        '2c68116494b5e7ff51e59ec79dd3e354e2a8035ab35e29b27a097d7baa47e48c71a2cdac651920c76cd29097c5e8710e74106e41a4b3d5f543e259ef7404beac'
        '4fda1af3ad7b1aec6b9c50ae27dacbc16e3bb57ef0f4a8d9fe0f820acf5212deb174c793805fbf45f70d6d3492650eb9bc2ecd3b9699e3aec2775e8989f25ec5'
        'a0f0e4f1400c717eed900bbd63be0d12fa76e832e33cf4347621c31b3ef8c7288d1d19c6ab3f4289f7ca8d69bc947fc7becbad4ba16d28d0102e88d1a4dab4af')

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

  # click 8.1 removed get_os_args, so replace with sys.argv[1:]
  # https://github.com/NXPmicro/spsdk/issues/44
  patch -Np1 -i ../$pkgname-1.6.3-click8.1.patch

  # support python-cryptography >= 37
  # https://github.com/NXPmicro/spsdk/issues/43
  patch -Np1 -i ../$pkgname-1.6.3-cryptography37.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  # ignore failing tests due to incompatible bincopy: https://github.com/NXPmicro/spsdk/issues/38
  pytest -v --ignore tests/elftosb/test_elftosb_mbi.py -k "not test_parse_image_file_invalid and not test_load_binary_image"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
