pkgname=obsidian-cli-inspector
pkgver=0.2.2
pkgrel=1
pkgdesc="Local-first CLI/TUI for indexing and querying Obsidian vaults"
arch=('x86_64')
url="https://github.com/jingyi-zhao-01/obsidian-cli-inspector"
license=('Apache-2.0')
depends=('sqlite')
makedepends=('cargo' 'gcc' 'pkgconf')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jingyi-zhao-01/obsidian-cli-inspector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("935de1d25a666a77138ae77cf94ce7e28a0d39e895763fa00905b7654edf73cd")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Prevent CI or user environment from injecting static Rust flags
  unset RUSTFLAGS
  unset CARGO_ENCODED_RUSTFLAGS
  unset CARGO_NET_OFFLINE

  # Ensure GNU linker is used (avoid ld.lld issues)
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
