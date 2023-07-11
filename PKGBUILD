# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.1.1
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1712ce1af9fe31d36153553fe515898f484cebb73c74db900623e62a5f2e9249')
b2sums=('e5dd977a7dfa1364b78b97e2833d423ea6d2d68de605e231a8ca0c71975d1f4cd74d52b890e0542c3f502a7253bd7b8d344d2a153154855021f2f3a24b72ae3c')

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

  PYTHONPATH="$srcdir/_test/usr/lib/python3.11/site-packages" \
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
