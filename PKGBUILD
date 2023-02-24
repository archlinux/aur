# Maintainer: Michael Adler <therisen06@gmail.com>

pkgname=notmuch-mailmover-git
pkgver=v0.1.0.r12.gad4f9e6
pkgrel=1
pkgdesc='notmuch-mailmover is a tool to move notmuch tagged mails into Maildir folders'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/michaeladler/notmuch-mailmover'
license=('Apache')
depends=('notmuch-runtime')
makedepends=('git' 'cargo')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname%-*}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-*}"
}
