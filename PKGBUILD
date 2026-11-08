# Maintainer: PJ568 <xidong-ai@foxmail.com>
pkgname=yaa-git
pkgver=2.17.0.r112.g58c2a71
pkgrel=1
pkgdesc='Yet Another Agent: analyze and execute natural-language tasks (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/byte-tea/yaa'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'zlib' 'brotli' 'zstd')
makedepends=('git' 'rust' 'cargo')
provides=('yaa')
conflicts=('yaa')
source=("$pkgname::git+https://github.com/byte-tea/yaa.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver
  ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf '%s.r%s.%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  # makepkg 的 LDFLAGS/CFLAGS 会干扰部分 crate 链接，清空后交给 Rust 默认工具链
  unset CFLAGS CXXFLAGS LDFLAGS
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/yaa "$pkgdir/usr/bin/yaa"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
