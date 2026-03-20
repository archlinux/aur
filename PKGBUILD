# Maintainer: Robert Rosca <robert@rosca.dev>

pkgname=nono-ai
_pkgname=nono
pkgver=0.20.0
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock'
arch=('x86_64' 'aarch64')
url='https://github.com/always-further/nono'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'libsecret: keyring credential storage via Secret Service API'
  'gnome-keyring: GNOME-based credential storage'
)
provides=('nono')
conflicts=('nono')
options=(!lto)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/always-further/nono/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8f7c8920b6578e57f7f61cf8c733883fddf87e8e479107d8ddf17390ea624bec')

prepare() {
  cd "${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-Wl,-z,relro,-z,now"
  export CARGO_INCREMENTAL=0
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --frozen --lib
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install built-in profile data if present
  if [ -d data ]; then
    find data -type f -exec install -Dm644 '{}' \
      "${pkgdir}/usr/share/${_pkgname}/{}" \;
  fi
}
