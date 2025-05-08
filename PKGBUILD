# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.0_alpha.6
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
sha256sums=('44cae1bb8ee118c1408144f9e6daf4aa16b0222d17f5d0db961d4c3ebce0fa6c')

prepare() {
  cd "${srcdir}/git"
  git submodule update --init --recursive
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
