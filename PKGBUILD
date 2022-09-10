# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.0.1
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz"
        fix-stubs-version.diff)
sha256sums=('c51b608e439f7c0f79f0227c30864613850021124f7134a03be676e345423057'
            '03a57fedca33a7158b939283cfcddc3cfaabfa0bb5b92d5004aa1779ad9ebd8c')
b2sums=('e205c55afe7d2947fb4ded3bd9cbc47d3a1566e47cf4edf647dfa0e3e3e7f165655ecee492f6d652d18cefde5d2383895474b5b61b89daf98619ed5fa4a785e7'
        '6f2b7eacf8c2da29aec2b9fb5fc2bdd2f9c022a8f0217bb62ba7db42f18db7239262a2088eb9521695f072083702a08a114f6867593a24e7381f020ad3f8134f')

prepare() {
  cd "pyrage-$pkgver"

  patch -Np1 -i "$srcdir/fix-stubs-version.diff"

  cargo fetch
}

build() {
  cd "pyrage-$pkgver"

  maturin build --release --strip --frozen

  python -m build --wheel --no-isolation pyrage-stubs
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
