# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.4
pkgrel=1
pkgdesc="An extremely fast Python type checker and language server, written in Rust."
arch=("x86_64")
url="https://github.com/astral-sh/ty"
license=("MIT")
depends=(
  "python"
)
makedepends=(
  "clang"
  "git"
  "lld"
  "python-build"
  "python-installer"
  "python-maturin"
)
source=("git::git+https://github.com/astral-sh/ty#tag=${pkgver//_/-}")
sha256sums=('7186fd28e7454cf56925f66ed1ce7ef502a9a133661800378bf4b95ee1fc1ecd')

prepare() {
  cd "${srcdir}/git"
  git submodule update --init --recursive
  cp ruff/rust-toolchain.toml .
}

build() {
  cd "${srcdir}/git"
  CC=clang RUSTFLAGS+=" -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld" \
    python -m build --wheel
}

package() {
  cd "${srcdir}/git"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/git/LICENSE"
}
