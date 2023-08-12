# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-lazrs
pkgdesc="Python bindings for laz-rs (LAZ compression)"
pkgver=0.5.2
pkgrel=1
url='https://github.com/laz-rs/laz-rs-python'
arch=('x86_64')
license=('MIT')

depends=('gcc-libs' 'glibc' 'python')
makedepends=('maturin' 'python-installer')

_pypi=lazrs
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '70880bea1c08b106c6ff46076a4eb299c2335100d5de73ef39777686932a849b'
)

build() {
  cd "$_pypi-$pkgver"
  maturin build --release --locked --strip \
                --interpreter /usr/bin/python \
                --target "$CARCH-unknown-linux-gnu"
}

check() {
  cd "$_pypi-$pkgver"
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test_dir "target/wheels/$_pypi-$pkgver-"*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  python -c 'import lazrs'
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "target/wheels/$_pypi-$pkgver-"*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
