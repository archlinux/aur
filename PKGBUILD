# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=amdfand-git
pkgver=v1.0.12.r5.g772498d
pkgrel=1
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("amdfand::git+https://github.com/Eraden/amdgpud.git")
arch=('x86_64')
conflicts=('amdfand-bin' 'amdfand')
provides=('amdfand')
sha512sums=('SKIP')
makedepends=('git' 'cargo')
optdepends=('amdmond' 'amdguid-glow' 'amdguid-wayland' 'amdvold')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin amdfand
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --bin amdfand
}

package() {
  cd "${pkgname%-git}"
  install -D -m 0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
  install -D -m 0755 -t "$pkgdir/usr/lib/systemd/system" "services/amdfand.service"
}

