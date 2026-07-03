# Maintainer: Simon Jackson <sizeak at gmail dot com>
pkgname=claude-commander
pkgver=0.24.0
pkgrel=1
pkgdesc='A high-performance terminal UI for managing Claude coding sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/sizeak/claude-commander'
license=('MIT')
depends=('tmux' 'git')
makedepends=('cargo')
# claude-commander strips its own binary via [profile.release] (strip = true),
# so opt out of makepkg's default debug-package split to avoid a broken/empty
# claude-commander-debug package.
#
# !lto: the `ring` crate (via reqwest/rustls) compiles C and assembly through a
# build script that inherits makepkg's CFLAGS. Arch's default `-flto=auto` turns
# those C objects into LTO bitcode that ring's static-lib link rejects ("archive
# member is neither ET_REL nor LLVM bitcode"). Stripping LTO from the C flags
# fixes the build; Rust's own release LTO is set in [profile.release], not here.
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sizeak/claude-commander/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80422f3f00243c77595fc283cca79f8d4c244b0ceb43db83f59b85ff2ad7a9b7')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
