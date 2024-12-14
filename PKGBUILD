# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.2.2
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76ed0c7d4a3cf5fdd740b56f569bcb7b940310b985f005983b03ba7e939d507b')
b2sums=('c51a5645a5fa883291ca041bc431476d14582b5b19e45d0d427fa4e61b516d0d76a90e5593f996516825317e4937d81f296baa32c522d3b2a8f8028e01ecc05c')

prepare() {
  cd "pyrage-$pkgver"

  cargo fetch
}

build() {
  cd "pyrage-$pkgver"

  maturin build --release --strip --frozen

  python -m build --wheel --no-isolation pyrage-stubs
}

check() {
  cd "pyrage-$pkgver"

  rm -rf "$srcdir/_test"
  python -m installer --destdir="$srcdir/_test" target/wheels/*.whl

  PYTHONPATH="$srcdir/_test/usr/lib/python3.12/site-packages" \
    python -m unittest
}

package_python-pyrage() {
  cd "pyrage-$pkgver"

  python -m installer --destdir="$pkgdir" target/wheels/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-pyrage-stubs() {
  arch=('any')

  cd "pyrage-$pkgver"

  python -m installer --destdir="$pkgdir" pyrage-stubs/dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
