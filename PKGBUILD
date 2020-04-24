# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2020.4.21.14.53.58
pkgrel=2
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://quaternion.readthedocs.io/"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy')
optdepends=(
  "python-numba: speedup of numerical functions"
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/n/numpy-quaternion/numpy-quaternion-$pkgver.tar.gz"
  'fix_numba_wrapper.patch'
)
sha256sums=(
  '4027fda144389be042d55076cdb77e2502eb9418ba7006529455a18d3e4feb6c'
  '1bac9fb70b55a287129b4b2c580749307030dcdcb7eb7281ed9c17f2ed38161b'
)

prepare() {
    cd "numpy-quaternion-$pkgver"
    patch -p1 -i "$srcdir/fix_numba_wrapper.patch"
}

build() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py build
}

check() {
    cd "numpy-quaternion-$pkgver"
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-$PYVER" PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
