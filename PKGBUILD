# Maintainer: João Vitor Polverari <dev at ayru dot dev>
pkgname=marmota-daily-git
pkgver=1.0.0.r135.g2c8bb00
pkgrel=1
pkgdesc='Daily note templating system'
arch=('x86_64' 'aarch64')
url='https://github.com/B3ella/groundhog'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=('marmota-daily')
conflicts=('marmota-daily')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/groundhog"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
}
