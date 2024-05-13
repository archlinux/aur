# Maintainer: Arne Brücher <archlinux[at]arne-bruecher[dot]de>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname=amdfand
pkgver=1.0.14
pkgrel=1
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("amdfand::git+https://github.com/Eraden/amdgpud.git")
arch=('x86_64')
conflicts=('amdfand-bin' 'amdfand-git')
provides=('amdfand')
sha512sums=('SKIP')
makedepends=('git' 'cargo')
optdepends=('amdguid-glow' 'amdguid-wayland')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin amdfand
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --bin amdfand
}

package() {
  cd "$pkgname"
  install -D -m 0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -D -m 0755 -t "$pkgdir/usr/lib/systemd/system" "services/amdfand.service"
}

