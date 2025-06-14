# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.10
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
b2sums=('c11effeecd228e2ca656546806ff5efa1ab5d7899a74c140e182d68239a6d98a72757cda75df11601bbdbd081566b67d608ec1715f0bf5c7b8973ab383472f1d')

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
