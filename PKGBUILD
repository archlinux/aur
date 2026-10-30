# Maintainer: agony <27015 at riseup dot net>

pkgname=pocket-tts-git
pkgver=r207.b20753a
pkgrel=1
pkgdesc="Kyutai's pocket-sized text-to-speech on the CPU, without Python (git version)"
arch=('x86_64' 'aarch64')
url='https://github.com/kyutai-labs/pocket-tts'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cargo' 'cmake')
provides=('pocket-tts')
conflicts=('pocket-tts')
options=('!lto')
source=("pocket-tts::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd pocket-tts
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd pocket-tts/rust
  # Upstream builds x86_64 for x86-64-v3; the target CPU comes from
  # RUSTFLAGS in makepkg.conf instead
  rm .cargo/config.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd pocket-tts/rust
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd pocket-tts/rust
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd pocket-tts
  install -Dm755 rust/target/release/pocket-tts -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 rust/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
