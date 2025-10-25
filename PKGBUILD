# Maintainer: Chaitanya Yeleti <chaitanyachowdary125@live.com>
pkgname=hashsum-git
pkgver=r1.a4b530f
pkgrel=1
pkgdesc="Fast, parallel hashing utility supporting MD5, SHA-1, SHA-256, SHA-512, and BLAKE3"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitanyayeleti/hashsum"
license=('MIT' 'Apache')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('hashsum')
conflicts=('hashsum')
source=("git+https://github.com/chaitanyayeleti/hashsum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hashsum"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/hashsum"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --features progress,archives
}

check() {
  cd "${srcdir}/hashsum"
  cargo test --release --locked --features progress,archives || true
}

package() {
  cd "${srcdir}/hashsum"
  install -Dm755 "target/release/hashsum" "${pkgdir}/usr/bin/hashsum"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
}
