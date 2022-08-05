# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgbase=python-pyrage
pkgname=(python-pyrage python-pyrage-stubs)
pkgver=1.0.0
pkgrel=1
pkgdesc="Python bindings for rage (age in Rust)"
arch=('x86_64')
url="https://pypi.org/project/pyrage"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'maturin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/woodruffw/pyrage/archive/refs/tags/v$pkgver.tar.gz"
        fix-stubs-version.diff)
sha256sums=('30071d3aa69762bcf8017de51faa13fb0b372eafebc42cb4383e1ad2427263cc'
            '03a57fedca33a7158b939283cfcddc3cfaabfa0bb5b92d5004aa1779ad9ebd8c')
b2sums=('b8f88bd4961f38151b8b4ff2de5e8f037572a049607006e1a466141562be2a9b743f879fedd8b5ca4804b19eac634d854506dbc47ef96ccba3532a469df25c99'
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
