# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.11
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
b2sums=('5233db05b856eb7efe4e7506f854c7cb161e91bd8025908134058448074b795b7169030c05690466fba0e27a4052f4d33fa8a285edbc847148a015f8be3f9602')

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
