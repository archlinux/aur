# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgbase=maturin-git
_pkgbase=maturin
pkgname=(
  maturin-git
  python-maturin-git
)
pkgver=1.8.6.r7.g529c8404
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
source=("${_pkgbase}::git+$url.git"
	"https://raw.githubusercontent.com/AerynOS/recipes/aef489e1845f2914d43bfd66cf91c5da0528efee/m/maturin/pkg/0001-Revert-Add-compression-level-option-to-build-command.patch")
sha512sums=('SKIP'
            'daf095bd9cc5ad84da3d79462b19cf1ce571ee3ff539dd2aa8c20514580ae6d4def7e2e818807d71fcbc90f0c2c36762135bdcfb442b93f873f3952d50ec7336')
b2sums=('SKIP'
        'fdbf0ef27e25db27f3dfb8d12362a7a861b1ab827aff568ef5ace2f05849bc56a8ec9a6cd0510a2faefa54df998e8903f867a5ede2a0246d86364bfadde0fd91')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed -r 's/^v//;s/-([^-]+)-g(.+)/.r\1.g\2/;s/-/./g'
}

prepare() {
  cd $_pkgbase
  sed -ri 's/^license = .*"([^"]+)"}/license = "\1"/' pyproject.toml
  patch -p1 < ../0001-Revert-Add-compression-level-option-to-build-command.patch
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
  cargo test --frozen --all-features -- "${cargo_skip_args[@]}"
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
