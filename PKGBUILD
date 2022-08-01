# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nrfutil
pkgname=python-nrfutil
pkgver=6.1.6
pkgrel=1
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
sha256sums=('f3594244b6ff1740bff99ff36ee74404ec7549ddcd3826a71b0a08366be1afdc')
b2sums=('55195b68a8bebd4ff4cf4c2b37fd29692c6267a2495142fd31b5cc0c372383d39f4f5d2c0720d366f79118a766a2deb24802dbcce54a64e5df717867d1983990')

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
