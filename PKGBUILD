# Maintainer: Robert Rosca <robert@rosca.dev>

pkgname=nono-ai
_pkgname=nono
pkgver=0.80.0
pkgrel=2
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock'
arch=('x86_64' 'aarch64')
url='https://github.com/nolabs-ai/nono'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'gnome-keyring: Secret Service credential storage (or any org.freedesktop.secrets provider)'
)
provides=("${_pkgname}=${pkgver}")
conflicts=('nono' 'nono-ai-bin')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d216e714883f237a5bac468a0141dc781a979eab2535957f63ecf27a1fffdc09')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

prepare() {
  cd "${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_INCREMENTAL=0
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-${pkgver}"
  cargo test --frozen --lib --release
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  for shell in bash zsh fish; do
    "target/release/${_pkgname}" completion "$shell" > "completion.$shell"
  done
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
