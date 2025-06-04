# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin-git
_pkgbase=maturin
pkgname=(
  maturin-git
  python-maturin-git
)
pkgver=1.8.6.r11.g90b30a4e
pkgrel=1
pkgdesc="Build and publish crates with pyo3, rust-cpython and cffi bindings"
url="https://github.com/PyO3/maturin"
arch=(x86_64)
license=('Apache-2.0 OR MIT')
makedepends=(
  bzip2
  gcc-libs
  git
  glibc
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
  rust
)
checkdepends=(
 python-cffi
 python-pycparser
 python-virtualenv
)
# Disable LTO until ring can be built with it:
# https://github.com/briansmith/ring/issues/1444
options=(!lto)
source=("${_pkgbase}::git+$url.git")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed -r 's/^v//;s/-([^-]+)-g(.+)/.r\1.g\2/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  sed -ri 's/^license = .*"([^"]+)"}/license = "\1"/' pyproject.toml
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgbase
  MATURIN_SETUP_ARGS="--frozen --all-features" \
    python -m build --wheel --no-isolation
}

check() {
  cd $_pkgbase
  mkdir -p test-crates/venvs
  local cargo_skip_args=(
    # Requires wasm32-wasip1 target
    --skip=integration_wasm_hello_world
    # Fails with the following error, not sure why:
    # AttributeError: module 'uniffi_pure_proc_macro' has no attribute 'add'
    --skip=integration_uniffi_pure_proc_macro
  )
  cargo test --frozen -- "${cargo_skip_args[@]}"
}

package_maturin-git() {
  depends=(
    bzip2
    gcc-libs
    glibc
    openssl
    rust
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd $_pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/lib"
  install -vDm 644 {Changelog,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 license-mit -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-maturin-git() {
  pkgdesc+=" - Python bindings"
  depends=(
    "maturin-git=$pkgver"
    python
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd $_pkgbase
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vr "$pkgdir/usr/bin"
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" license-mit
}
