# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
pkgname=aurox
pkgver=0.1.0
pkgrel=1
pkgdesc='AUR helper backed by the github.com/archlinux/aur mirror'
arch=('x86_64')
url='https://github.com/nikicat/aurox'
license=('MIT')
depends=('pacman' 'curl' 'gcc-libs' 'glibc' 'git')
makedepends=('cargo')
# makepkg's -flto=auto turns the bundled sqlite3.c into GCC LTO IR that
# rust-lld cannot read (undefined sqlite3_* symbols); Rust does its own LTO.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f74d33845b96619c55f4004f469af74644be7b6428bea2a87501ba5133bd04f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin aurox
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/aurox "$pkgdir/usr/bin/aurox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
