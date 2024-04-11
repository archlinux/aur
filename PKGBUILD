# Maintainer: David Runge <dvzrv@archlinux.org>

_name=spsdk
pkgname=python-spsdk
pkgver=2.1.1
pkgrel=2
pkgdesc="NXP Secure Provisioning SDK"
arch=(any)
url="https://github.com/nxp-mcuxpresso/spsdk"
license=(BSD-3-Clause)
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
  python-crcmod
  python-cryptography
  python-deepmerge
  python-fastjsonschema
  python-hexdump
  python-libusbsio
  python-oscrypto
  python-platformdirs
  python-prettytable
  python-pylink-square
  python-pyocd
  python-pyserial
  python-requests
  python-ruamel-yaml
  python-sly
  python-typing_extensions
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
  $pkgname-2.1.0-remove_pypemicro.patch
)
sha512sums=('3ef8398eb0f3008b50a0cac7f9491913f6acc70513f50351a0e15fb64af7759c18f1771a9ca0d297f7977df20e4278072c1b8f70613d1af5d962ab2b0c54f2e6'
            '52977b5caaf43c3a4f14a5c493d499a64dc6d9ad1af163570f311f723d485dd6d836a2a64946b1c364fe3942f4cc607a777dbb965a340ecfc271a9bd03f77af4')
b2sums=('5c93d63232d94ad2c2840c41a88f441ae76d4dcf8598f440ee5203626a8c7716a06bd841f1a830ebbada1262c917c5e4380ab905418c4cf7f2414325635d460b'
        '0b28b43bb84ff4083ceb2ba3115859d38814725d743897122e70b724bd462d6093458569a2380549b931f772ce067dbcddd12b0a108a05bdd8b9746cf547e140')

prepare() {
  cd $_name-$pkgver
  # remove all version pinning and overly explicit version bounds
  # https://github.com/NXPmicro/spsdk/issues/35
  sed -e 's|>=.*||g;s|==.*||g;s|~=.*||g;s|<.*||g' -i requirements{,-develop}.txt
  # remove dependency on python-pypemicro as it vendors prebuilt shared libraries
  # https://github.com/NXPmicro/spsdk/issues/30
  # https://github.com/NXPmicro/pypemicro/issues/10
  sed '/pypemicro/d' -i requirements.txt
  patch -Np1 -i ../$pkgname-2.1.0-remove_pypemicro.patch
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
    --ignore tests/mcu_examples/test_jupyter.py  # we don't care about examples
    # tests due to missing files and whatever other reasons: https://github.com/nxp-mcuxpresso/spsdk/issues/66
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA1-secp256r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA1-secp384r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA1-secp521r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA1-rsa2048]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA1-rsa4096]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA256-secp384r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA256-secp521r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA384-secp256r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA384-secp521r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA384-rsa2048]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA384-rsa4096]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA512-secp256r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA512-secp384r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA512-rsa2048]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.SHA512-rsa4096]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.MD5-secp256r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.MD5-secp384r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.MD5-secp521r1]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.MD5-rsa2048]'
    --deselect 'tests/nxpcrypto/test_nxpcrypto.py::test_nxpcrypto_create_signature_algorithm[EnumHashAlgorithm.MD5-rsa4096]'
    --deselect 'tests/nxpimage/test_nxpimage_sb31.py::test_nxpimage_sb31_kaypair_not_matching'
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
