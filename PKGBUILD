# Maintainer: Simon Jackson <sizeak at gmail dot com>
pkgname=claude-commander
pkgver=0.12.1
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
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sizeak/claude-commander/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ed34614f5c39cb4e42979c502032c3c8dfba2d386d4a4a5519a49112339cb67')

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
