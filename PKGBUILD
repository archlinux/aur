# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.34
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
b2sums=('dda970b041ae1bd34ea3a41611758b5a34a47de2702c891cb4a65f0b85cfaa2744d537a2e1f6dec5c9774024ad5162680f710cd491e2e8cde2a0643b1e6bc728')

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
