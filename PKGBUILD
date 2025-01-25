# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.2.3
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('694c8061270ab7fb03dd2d1359900e76e06026dd108fa83b52d0136ca6b2d18a')
b2sums=('60b6734dc80c50ada3392255cbae60c23bc9b7884207be4fcbbe0590e56bcdb4966eb40c173a63b47ef093a46a221447d46d647d2925f9c55095b6b31bc0586f')

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

  PYTHONPATH="$srcdir/_test"$(python -c 'import site; print(site.getsitepackages()[0])') \
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
