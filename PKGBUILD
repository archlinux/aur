# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Rendered by .github/workflows/release.yml: @PKGVER@ is replaced with the
# release tag and sha256sums is filled by updpkgsums during the test build,
# so the published PKGBUILD is exactly what was built and verified.
pkgname=aurox
pkgver=0.1.4
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
sha256sums=('2af43173c3ab796aec5904a9e0b6a70d559c6e9c95f7c271451400f52ff8f6f4')

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
