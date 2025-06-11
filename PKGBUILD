# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.9
pkgrel=1
pkgdesc="An extremely fast Python type checker and language server, written in Rust."
arch=("x86_64")
url="https://github.com/astral-sh/ty"
license=("MIT")
depends=(
  python
)
makedepends=(
  git
  maturin
  python-installer
)
options=(!lto)
source=("git::git+${url}#tag=${pkgver//_/-}")
b2sums=('d71fbbe42dc58c580ee672a5033e65f00062dd3a68b41a45c843f2bed6664cd342b99c4bd059e21d05c82e7f1aa6a61a0ecccd17976dc67b65b426ed3c4b0996')

prepare() {
  cd "${srcdir}/git"
  git submodule update --init --recursive
  cp ruff/rust-toolchain.toml .
  cargo fetch --manifest-path ruff/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/git"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/git/ruff/target/wheels"/*.whl

  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/git/LICENSE"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r "${srcdir}/git/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/"
}
