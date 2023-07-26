# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=1.11.0
pkgrel=1
pkgdesc="NXP Secure Provisioning SDK"
arch=(any)
url="https://github.com/NXPmicro/spsdk"
license=(BSD)
depends=(
  python
  python-asn1crypto
  python-astunparse
  python-bincopy
  python-bitstring
  python-click
  python-click-command-tree
  python-click-option-group
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
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pyftdi
  python-pytest
  python-pytest-xdist
  python-voluptuous
)
optdepends=(
  'python-pyftdi: for dk6'
)
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-1.6.0-remove_pypemicro.patch
)
sha512sums=('1c798dc7dbaa1e7f666255d9b8b269ac0920812f085f27c7401d7458c518b87a4dc8e3792c85b0b8dbc1de0e7f36e4d31685252b21af37bd578688e424bf0b2f'
            '7bfb3739053284ba0b4084c1f84e37e307233fa7b52adf403fa5c574393d71e08ea02bdc927106b036d1055f6efd6c326b534d697c1d5f6c097def53dbafc560')
b2sums=('e7baba27e824c658ff6233694fba06796dcfffe8d3c72840f732a08bbd72c1a1f8af5015220f7431c6513d22ad787acc02610d3686625d20c1597e8f93518115'
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
  local pytest_options=(
    -vv
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
