# Maintainer: MihaiStreames <72852703+MihaiStreames@users.noreply.github.com>
pkgname=python-ghlang
_pypiname=ghlang
pkgver=3.0.2
pkgrel=1
pkgdesc="Generate animated language-stats SVG cards from your GitHub profile or local codebase."
arch=(x86_64)
url="https://github.com/MihaiStreames/ghlang"
license=(MIT)
depends=(
  python
  python-rich
  python-typer
)
makedepends=(
  cargo
  python-installer
  python-maturin
  rust
)
optdepends=(
  'tokount: local directory analysis with ghlang local'
)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
sha256sums=('290c17bef91ce3e46c06eca356643300b21f2cfd39e30b91d3dcbcb846e015ab')
options=(!lto)

prepare() {
  cd "$srcdir/$_pypiname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  export CARGO_TARGET_DIR=target
  maturin build --locked --release --strip
}

check() {
  cd "$srcdir/$_pypiname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
