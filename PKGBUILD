# Maintainer: Chaitanya Yeleti <chaitanyachowdary125@live.com>
pkgname=hashcc-git
pkgver=r1.a4b530f
pkgrel=1
pkgdesc="Fast, parallel hashing utility supporting MD5, SHA-1, SHA-256, SHA-512, and BLAKE3"
arch=('x86_64' 'aarch64')
url="https://github.com/chaitanyayeleti/hashcc"
license=('MIT' 'Apache')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('hashcc')
conflicts=('hashcc')
source=("git+https://github.com/chaitanyayeleti/hashcc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hashcc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/hashcc"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --features progress,archives
}

check() {
  cd "${srcdir}/hashcc"
  cargo test --release --features progress,archives || true
}

package() {
  cd "${srcdir}/hashcc"
  install -Dm755 "target/release/hashcc" "${pkgdir}/usr/bin/hashcc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
}
