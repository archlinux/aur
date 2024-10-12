# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.2.1
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1406d5d88f908de4e0082abbeb8c56f334e655ebd7f65b6cb353b215c885b8a1')
b2sums=('0206812c2a9d30b140a65977d0522eb99b48a609e2b54c6b77a617c796b11b8b2ad3b4ed5bb2fca5d108f996acadd0d4775c0c77a71fd6f290e923bb8357459d')

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
