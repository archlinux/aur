# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.3
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
sha256sums=('c9affb982f26406d331fc2dfe0ac13bc7ada155f464c3b3c2a3850240e3f6693')

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
