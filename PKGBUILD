# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2019.7.23.15.26.49
pkgrel=4
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://github.com/moble/quaternion"
arch=('x86_64')
license=('MIT')
depends=('python-numpy>=1.13' 'python-scipy')
optdepends=(
  "python-numba: speedup of numerical functions"
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/n/numpy-quaternion/numpy-quaternion-$pkgver.tar.gz"
  "fix-tests.patch"
)
sha256sums=(
  '42289bafc3292959173d93736f9c875b5c69d472934f04a76883b7b185adc42e'
  '6418231f9ab5e3bc2fe419b65feff18f694cf877c1e744f011bde83250eda655'
)

prepare() {
    cd "numpy-quaternion-$pkgver"
    patch --forward --strip=1 --input="$srcdir/fix-tests.patch"
}

build() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py build
}

check() {
    cd "numpy-quaternion-$pkgver"
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-$PYVER" pytest
}

package() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
