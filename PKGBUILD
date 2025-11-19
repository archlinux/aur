# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.27
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
source=("${pkgname}::git+${url}#tag=${pkgver//_/-}")
b2sums=('be1a968e7fc06d41abc3913c292f7397dfedeea3114f397a1b1d7b6acb9cbc1b9d1321c83afb2a2ee4e6fd25a725dc919c5d24e97ea74ef901fd432de6d5488e')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  cp ruff/rust-toolchain.toml .
  cargo fetch --manifest-path ruff/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/${pkgname}/ruff/target/wheels"/*.whl

  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname}/LICENSE"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r "${srcdir}/${pkgname}/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/"

  "${pkgdir}/usr/bin/ty" generate-shell-completion bash | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  "${pkgdir}/usr/bin/ty" generate-shell-completion elvish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
  "${pkgdir}/usr/bin/ty" generate-shell-completion fish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  "${pkgdir}/usr/bin/ty" generate-shell-completion zsh | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
