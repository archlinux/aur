pkgname=obsidian-cli-inspector-git
pkgver=obsidian.cli.inspector.v1.0.2.r0.g58ee551
pkgrel=1
pkgdesc="Local-first CLI/TUI for indexing and querying Obsidian vaults (unstable git version)"
arch=('x86_64')
url="https://github.com/jingyi-zhao-01/obsidian-cli-inspector"
license=('Apache-2.0')
depends=('sqlite')
makedepends=('cargo' 'gcc' 'pkgconf' 'git')
options=('!lto' '!debug')
source=("git+https://github.com/jingyi-zhao-01/obsidian-cli-inspector.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --always | sed -E "s/^v//; s/-([0-9]+)-g/.r\\1.g/; s/-/./g; s/[^0-9A-Za-z.]/./g"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Prevent CI or user environment from injecting static Rust flags
  unset RUSTFLAGS
  unset CARGO_ENCODED_RUSTFLAGS
  unset CARGO_NET_OFFLINE

  # Ensure GNU linker is used (avoid ld.lld issues)
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 target/release/obsidian-cli-inspector "${pkgdir}/usr/bin/obsidian-cli-inspector"
}
