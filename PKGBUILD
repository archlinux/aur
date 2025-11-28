# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.29
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
b2sums=('f30f072ead88f78c7552fbdf82ddb2e7e6710b76c104fd58d422828b7680ea2926238ff3fc4a63da0d20e56a6448f0101d36ccfcc3b922689e86e34b1a40c110')

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
