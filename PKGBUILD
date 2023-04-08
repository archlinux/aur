# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nrfutil
pkgname=python-nrfutil
pkgver=6.1.7
pkgrel=2
pkgdesc="CLI utility supporting Device Firmware Updates (DFU) and cryptographic functionality"
arch=(any)
url="https://github.com/NordicSemiconductor/pc-nrfutil"
license=(custom)
depends=(
  python-click
  python-crcmod
  python-ecdsa
  python-intelhex
  python-libusb1
  python-pc-ble-driver-py
  python-piccata
  python-protobuf
  python-pyserial
  python-pyspinel
  python-pyyaml
  python-tqdm
)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-behave python-nose)
# tests are not included in sdist tarballs from pypi.org: https://github.com/NordicSemiconductor/pc-nrfutil/issues/385
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=(pc-$_name-$pkgver.tar.gz::https://github.com/NordicSemiconductor/pc-$_name/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('fb1a1d52775c1deeced0c8f8815ecc70958ad71a5f368ec3baf8154f63caa4fe')
b2sums=('99b3726f2a4d1697c34d59be264df088c27b82a009b646bb9eff09f339e34a67285e53e1b30e53e42a24625aaf40947f644cf8f133a66eb33f4e39983b5b1a96')

build() {
  cd pc-$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pc-$_name-$pkgver
  nosetests -v -e test_dfu_ble_address
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd pc-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # remove precompiled libusb for other OSes: https://github.com/NordicSemiconductor/pc-nrfutil/issues/387
  rm -frv "$pkgdir/$_site_packages/libusb/"
  # remove requirements.txt: https://github.com/NordicSemiconductor/pc-nrfutil/issues/386
  rm -frv "$pkgdir/$_site_packages/requirements.txt"

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
