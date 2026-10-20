# Maintainer: Robert Rosca <robert@rosca.dev>

pkgname=nono-ai
_pkgname=nono
pkgver=0.80.0
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock'
arch=('x86_64' 'aarch64')
url='https://github.com/nolabs-ai/nono'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'libsecret: keyring credential storage via Secret Service API'
  'gnome-keyring: GNOME-based credential storage'
)
provides=('nono')
conflicts=('nono' 'nono-ai-bin')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d216e714883f237a5bac468a0141dc781a979eab2535957f63ecf27a1fffdc09')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_INCREMENTAL=0
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --frozen --lib --release
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
