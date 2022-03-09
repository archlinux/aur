# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.6.1
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
  python-libusbsio
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
  python-pyyaml
)
# pypi sdist tarball has no tests: https://github.com/NXPmicro/spsdk/issues/37
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=(
  $_name-$pkgver.tar.gz::https://github.com/NXPmicro/$_name/archive/refs/tags/$pkgver.tar.gz
  $pkgname-1.6.0-remove_pypemicro.patch
)
sha512sums=('6db59ffc83bb09e9323d3c3717837c75ed7ed759e8464288c8920a68e4d108e04067d98f24c28131ff81e4df5b171bb96f454aaade52e0891e79b076fbcb716c'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560')
b2sums=('79255018e711e4005e058c09986cbe8e44796c2bfd0e94fd8f62ef06ad01c269ed207a18c32e76e2c6f2b069edac3907d5fbaf466823609b50a94c1573f1c350'
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
  python setup.py build
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  # ignore failing tests due to incompatible bincopy: https://github.com/NXPmicro/spsdk/issues/38
  pytest -v --ignore tests/elftosb/test_elftosb_mbi.py -k "not test_parse_image_file_invalid and not test_load_binary_image"
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
