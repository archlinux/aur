# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.6.0
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
  python-oscrypto
  python-pycryptodome
  python-pylink-square
  python-pyocd
  python-pyserial
  python-ruamel-yaml
  python-sly
)
makedepends=(python-setuptools)
checkdepends=(
  python-jsonschema
  python-pytest
  python-voluptuous
  python-yaml
)
# pypi sdist tarball has no tests: https://github.com/NXPmicro/spsdk/issues/37
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=(
  $_name-$pkgver.tar.gz::https://github.com/NXPmicro/$_name/archive/refs/tags/$pkgver.tar.gz
  $pkgname-1.6.0-remove_pypemicro.patch
  $pkgname-1.6.0-remove_libusbsio.patch
)
sha512sums=('ced4a60427ebf9f726ffdda5fb941cf07cfd9c13885a9683d0a098398f49b3b515ac6bfb44756710a7b7b9db1f08bba43e5dc61b41104e5be3e72dfe8070e593'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560'
            '7774590f9e859ef1fb520876cb4e856dc8ce964769d16102bf0f480dd968074d0550d03e4601a314c88f57d627bf452f36b08d9a7fc5dc3374ab29c7fcc72da2')
b2sums=('de62d70ef4ff9478693f5188b08819ed36104a7ae9df016d9e60d2293aeaa3b5256bcfd110c86f0ae87c0ad36e43d777a8fb15e0d7cd3b85f6db62a9fb894d95'
        '2c68116494b5e7ff51e59ec79dd3e354e2a8035ab35e29b27a097d7baa47e48c71a2cdac651920c76cd29097c5e8710e74106e41a4b3d5f543e259ef7404beac'
        '3aa82795c61ab419deaf60a29a2cadf549a2d4f1446e2af5b959fa22164845018a03028c4a7523564419d9bdb8eb73180607b8d12e63ed57579647643b7398bb')

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
  # remove dependency on python-libusbsio as it vendors prebuilt shared libraries
  # https://github.com/NXPmicro/spsdk/issues/36
  sed '/libusbsio/d' -i requirements.txt
  patch -Np1 -i ../$pkgname-1.6.0-remove_libusbsio.patch
}

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  # ignore failing tests due to removal of libusbsio
  # ignore failing tests due to incompatible bincopy: https://github.com/NXPmicro/spsdk/issues/38
  pytest -v --ignore tests/utils/test_nxpdevscan.py --ignore tests/elftosb/test_elftosb_mbi.py \
   -k "not test_parse_image_file_invalid and not test_load_binary_image"
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
