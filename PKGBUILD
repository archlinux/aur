# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=ty
pkgver=0.0.2
pkgrel=2
pkgdesc="Extremely fast Python type checker and language server, written in Rust"
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
source=(
  "${pkgname}::git+${url}#tag=${pkgver//_/-}"
  ruff::git+https://github.com/astral-sh/ruff
)
b2sums=('330b63d5cdb482f20d4e87a020b1f8c1c06c1e042e866e902b6835c0d18ffb6aa507ea4c5aeb7c221e1f2fb53d48e87c5dde077eb0afe0f76a1a18bfb8ff24d9'
        'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.ruff.url "${srcdir}/ruff"
  git -c protocol.file.allow=always submodule update
  cargo fetch --manifest-path "ruff/crates/${pkgname}/Cargo.toml" --locked --target "$(rustc --print host-tuple)"
}

build() {
  local target="$(rustc --print host-tuple)"
  local target_binary="ruff/target/${target}/release/${pkgname}"

  cd "${srcdir}/${pkgname}"
  maturin build --locked --release --all-features --target "${target}" --strip

  for completion in bash elvish fish nushell zsh; do
    "${target_binary}" generate-shell-completion "${completion}" > "${completion}-completions"
  done
}

check() {
  cd "${srcdir}/${pkgname}"
  cargo test --manifest-path "ruff/crates/${pkgname}/Cargo.toml" --frozen --all-features
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r "${srcdir}/${pkgname}/docs/"* "${pkgdir}/usr/share/doc/${pkgname}/"

  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" ruff/target/wheels/*.whl
  install -Dm644 bash-completions "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 elvish-completions "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
  install -Dm644 fish-completions "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 nushell-completions "${pkgdir}/usr/share/nushell/vendor/autoload/${pkgname}.nu"
  install -Dm644 zsh-completions "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
