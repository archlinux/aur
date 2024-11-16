# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-lazrs
pkgdesc="Python bindings for laz-rs (LAZ compression)"
pkgver=0.6.2
pkgrel=1
url='https://github.com/laz-rs/laz-rs-python'
arch=('x86_64')
license=('MIT')

depends=('gcc-libs' 'glibc' 'python')
makedepends=('python-build' 'python-installer' 'python-maturin')

_pypi=lazrs
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'e8581313c8f438b802baf92654bd0fde3cf4ecb8f881bdf4906934344bda3a9b'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver-"*.whl
  test-env/bin/python -c 'import lazrs'
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
