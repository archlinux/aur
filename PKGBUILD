# Maintainer: PJ568 <xidong-ai@foxmail.com>
pkgname=xidong-git
pkgver=0.1.0.r203.g1e5ebf7
pkgrel=1
pkgdesc='Lightweight CLI agent whose only tool is the shell (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/Xidong-AI/xidong'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd')
makedepends=('git' 'rust' 'cargo')
provides=('xidong')
conflicts=('xidong')
source=("$pkgname::git+https://github.com/Xidong-AI/xidong.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver
  ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf '%s.r%s.%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  # makepkg 的 LDFLAGS/CFLAGS 会干扰 bundled SQLite 链接，清空后交给 Rust 默认工具链
  unset CFLAGS CXXFLAGS LDFLAGS
  cargo build --release --bin xidong --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/xidong "$pkgdir/usr/bin/xidong"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
