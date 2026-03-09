# Maintainer: André Danielsson <andredanielsson93@gmail.com>

pkgname=magi
pkgver=0.5.0
pkgrel=1
pkgdesc="Keyboard-driven Git TUI inspired by Magit"
arch=('x86_64')
url="https://github.com/anddani/magi"
license=('MIT')
depends=('zlib' 'openssl' 'libgit2' 'libssh2')
makedepends=('git' 'cargo' 'pkg-config')
options=('!debug')
source=('git+https://github.com/anddani/magi')
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"

  # Force Cargo to use the system libraries via pkg-config
  # instead of trying to build them from C source code.
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export LIBGIT2_SYS_USE_PKG_CONFIG=1

  cargo build --release --frozen
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/magi" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
