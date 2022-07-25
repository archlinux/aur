# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgver=0.1.1-rc.2
pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('8f6b12829e2ea4ce217ebeb41ec3f83fe4e37aa07b60fb8b81e5f2f981118a1d')
b2sums=('013b9201e82419ef608e2b8039518f3cc5108954239797e9d2c7f92b77ef58ad3b79c1907d8f86c3faa9d4738ef9c16999afdba96da7ad428cdc0b17f414de86')

prepare() {
  cd "pyrage-$_pkgver"

  cargo fetch
}

build() {
  cd "pyrage-$_pkgver"

  maturin build --release --strip --frozen

  python -m build --wheel --no-isolation pyrage-stubs
}

package_python-pyrage() {
  cd "pyrage-$_pkgver"

  python -m installer --destdir="$pkgdir" target/wheels/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-pyrage-stubs() {
  arch=('any')

  cd "pyrage-$_pkgver"

  python -m installer --destdir="$pkgdir" pyrage-stubs/dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
