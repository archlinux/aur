# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pc-ble-driver-py
pkgname=python-pc-ble-driver-py
pkgver=0.17.0
pkgrel=2
pkgdesc="Serialization library over serial port providing bindings for nrf-ble-driver"
arch=(x86_64)
url="https://github.com/NordicSemiconductor/pc-ble-driver-py"
license=(custom)
depends=(gcc-libs glibc pc-ble-driver python-cryptography python-wrapt)
makedepends=(cmake ninja python-build python-installer python-scikit-build python-setuptools python-wheel swig)
# no sdist tarballs on pypi.org: https://github.com/NordicSemiconductor/pc-ble-driver-py/issues/185
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=(
  $_name-$pkgver.tar.gz::https://github.com/NordicSemiconductor/pc-ble-driver-py/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-0.17.0-build_deps.patch
)
sha256sums=('1e9ef5c1d994bc12aef0c5a325beb6845cb31a9c70c0bcb0e2639c19b6e689f5'
            'dddbdeaffeb7c4c3cbc399199157b108965f19b29c985ae4ef0f262a95865ad9')
b2sums=('923503b0b1eebe9e39c74bb1b0a0ef9a070f6f25f51d7728df844a5c7bd9a23f454da08b7f4873f364b914e1052ccfeed3488464d8b7a05145c7a0a959c9346f'
        'caa70040fd664546b53e7ad481b41d1e910c4cfdb00f5e9f89306c0ba6ad9823d8e520adc9a04bc607c01c316940600bb4f3444bd50c5a5e87f312895f688050')

prepare() {
  # we do not need tox, cmake or ninja as build tools
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.17.0-build_deps.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: tests can not be run: https://github.com/NordicSemiconductor/pc-ble-driver-py/issues/225

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
