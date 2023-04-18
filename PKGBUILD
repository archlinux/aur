# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgbase=amdfand
pkgname=amdfand
pkgver=1.0.11
pkgrel=1
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("amdfand::git+https://github.com/Eraden/amdgpud.git#tag=v${pkgver}")
arch=('x86_64')
conflicts=('amdfand-bin')
provides=('amdfand' 'amdfand-bin')
sha512sums=('SKIP')
makedepends=('git' 'cargo')
#optdepends=('amdmond' 'amdguid-glow' 'amdguid-wayland' 'amdvold')

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

