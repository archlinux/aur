# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=ty
pkgver=0.0.1_alpha.19
pkgrel=2
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
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver//_/-}")
b2sums=('8fc21953dd7a2ea215bf1fcbfd1457a47b1e37e79306b43857f5eb1528ba730f5712981d08e5b3e1a1fca312abc200ed212330aff2e526dd4fc0de1f24f65f05')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule update --init --recursive
  cp ruff/rust-toolchain.toml .
  cargo fetch --manifest-path ruff/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}/${pkgname}-${pkgver}/ruff/target/wheels"/*.whl

  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "$srcdir/${pkgname}-${pkgver}/LICENSE"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/"

  "${pkgdir}/usr/bin/ty" generate-shell-completion bash | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  "${pkgdir}/usr/bin/ty" generate-shell-completion elvish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
  "${pkgdir}/usr/bin/ty" generate-shell-completion fish | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  "${pkgdir}/usr/bin/ty" generate-shell-completion zsh | install -D -m 0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
