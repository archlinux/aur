# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=python-mpy-cross-v6
_name=mpy_cross_v6
pkgver=1.1.2
pkgrel=1
pkgdesc="Python wrapper for the MicroPython mpy-cross compiler (MPY ABI v6), used by pybricksdev"
arch=('x86_64' 'aarch64')
url="https://github.com/pybricks/python-mpy-cross"
license=('MIT')
depends=('python' 'glibc')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE-micropython::https://raw.githubusercontent.com/micropython/micropython/v1.22.0/LICENSE")
sha256sums=('6accc831761e8dc2eb778f937808f6bc72650fefc1fc6aa96bfc23867fbadfea'
            'd9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037')

build() {
  cd "$_name-$pkgver"
  # upstream Makefile ignores LDFLAGS; pass hardening flags through its hook
  export LDFLAGS_EXTRA="$LDFLAGS"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/LICENSE-micropython" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
